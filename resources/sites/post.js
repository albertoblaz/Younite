if(!me) cancel("Unauthorized", 403);
if(me.role != 'site' || !internal) cancel("You must be a disco user", 401);

protect('users');
protect('events');
this.owner = me;

dpd.discouser.put(me, {sites: {$push: this.id}}, function(result, err) {
    if (err) cancel(err);
});
