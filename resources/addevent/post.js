var event = parts[0];
if (!event) cancel("You must provide a event");
if (!me) cancel("You must be logged in");

var _ = require('underscore');

cancelIf(_.contains(me.events, event),"Already added",400);

var notification = {agent : event, from : me, type : 'event', action : 'going'};
var activity = {agent : site, timestamp : new Date(), type : 'site', action : 'follow'};

dpd.events.get(event, function(result, error) {
  cancelIf(error);
  dpd.users.put(me.id, {events: {$push: event}, activity : {$push : activity}}, function(result, err) {
      cancelIf(err);
      dpd.events.put(event, {users: {$push: me.id}}, function(result, err) {
          cancelIf(err);
          dpd.notifications.post(notification, function(res, err){
                cancelIf(err);
          });
      });
  });
});
