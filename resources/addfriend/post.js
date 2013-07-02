var user = parts[0];
if (!user) cancel("You must provide a user");
if (!me) cancel("You must be logged in");

var _ = require('underscore');

dpd.users.get(user, function(result, err) {
    cancelIf(err);
    if(_.contains(me.petitionsFrom)){
        var activityMe = {agent : user, timestamp : new Date(), type : 'friend', action : 'new'};
        var notificationMe = {agent : user, from : me, type : 'friend', action : 'new'};

        dpd.users.put(me.id, {friends: {$push: user}, activity : {$push : activityMe}}, function(result, err) {
        cancelIf(err);
            dpd.notifications.post(notificationMe, function(res, err){
                cancelIf(err);
            });
        });
        
        var activityFriend = {agent : user, timestamp : new Date(), type : 'friend', action : 'new'};
        var notificationFriend = {agent : me, from : user, type : 'friend', action : 'new'};

        dpd.users.put(user, {friends: {$push: me.id}, activity : {$push : activityFriend}}, function(result, err) {
        cancelIf(err);
            dpd.notifications.post(notificationFriend, function(res, err){
                cancelIf(err);
            });
        });
    } else {
        dpd.users.put(me.id, {petitionsTo: {$push: user}}, function(result, err) {
        cancelIf(err);
            dpd.notifications.post(notificationMe, function(res, err){
                cancelIf(err);
            });
        });
        dpd.users.put(user, {petitionsFrom: {$push: me.id}}, function(result, err) {
        cancelIf(err);
            dpd.notifications.post(notificationMe, function(res, err){
                cancelIf(err);
            });
        });
    }
});