if(!me) cancel("Unauthorized", 403);
if(me.role != 'site' && !internal) cancel("You must be a disco user", 401);


protect('users');
protect('events');
protect('owner');

this.owner = me.id;

dpd.discouser.put(me, {site: this.id}, function(result, err) {
    cancelIf(err);
});
