var event = parts[0];
if (!event) cancel("You must provide a event");

dpd.users.put(me, {events: {$pull: event}}, function(result, err) {
    if (err) cancel(err);
    dpd.events.put(event, {users: {$pull: me.id}}, function(result, err) {
        if (err) cancel(err);
    });
});
