var event = parts[0];
if (!event) cancel("You must provide a event");
if (!me) cancel("You must be logged in");

dpd.events.get(event, function(result, error) {
  cancelIf(error);
  dpd.users.put(me.id, {events: {$push: event}}, function(result, err) {
      cancelIf(err);
      dpd.events.put(event, {users: {$push: me.id}}, function(result, err) {
          cancelIf(err);
          dpd.notifications.post({agent : event, from : me, type : 'event', action : 'going'}, function(res, err){
                cancelIf(err);
          });
      });
  });
});
