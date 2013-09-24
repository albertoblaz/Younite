if(!me) cancel("You must be logged", 401);
if(me.role != 'site') cancel("You must be a disco user", 401);

var self = this;
var _ = require('underscore');

protect('users');
this.idDisco = me.site;

dpd.sites.put(self.idDisco, {events: {$push: self.id}}, function(res, err){
    cancelIf(err, err, 500);
});




