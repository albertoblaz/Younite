var event = parts[0];
if (!event) cancel("You must provide a event");
if (!me) cancel("You must be logged in");

dpd.events.get(event, function(result, error) {
  if(!error){
    dpd.users.put(me.id, {events: {$push: event}}, function(result, err) {
        if (err) cancel(err);
        dpd.events.put(event, {users: {$push: me.id}}, function(result, err) {
            if (err) cancel(err);
        });
    });
  }
});
