var user = parts[0];
if (!user) cancel("You must provide a user");
if (!me) cancel("You must be logged in");

var _ = require('underscore');

cancelIf(user === me.id, "Not a valid user", 400);
cancelIf(_.contains(me.friends, user),"Already added",400);
cancelIf(_.contains(me.petitionsTo, user),"Already added",400);

dpd.users.get(user, function(result, err) {
    cancelIf(err);
    if(_.contains(me.petitionsFrom, user)){
        var activityMe = {agent : user, timestamp : new Date(), type : 'friend', action : 'new'};
        var notificationMe = {agent : user, from : me.id, type : 'friend', action : 'new'};

        dpd.users.put(me.id, {friends: {$push: user}, activity : {$push : activityMe} , petitionsFrom : {$pull : user}}, function(result, err) {
        cancelIf(err);
            dpd.notifications.post(notificationMe, function(res, err){
                                console.log(err);

                cancelIf(err);
            });
        });

        var activityFriend = {agent : me.id, timestamp : new Date(), type : 'friend', action : 'new'};
        var notificationFriend = {agent : me.id, from : user, type : 'friend', action : 'new'};

        dpd.users.put(user, {friends: {$push: me.id}, activity : {$push : activityFriend}, petitionsTo : {$pull : me.id}}, function(result, err) {
            cancelIf(err);
            dpd.notifications.post(notificationFriend, function(res, err){
                console.log(err);
                cancelIf(err);
            });
        });
    } else {
        dpd.users.put(me.id, {petitionsTo: {$push: user}}, function(result, err) {
            cancelIf(err);
        });
        dpd.users.put(user, {petitionsFrom: {$push: me.id}}, function(result, err) {
            cancelIf(err);
        });
    }
});
