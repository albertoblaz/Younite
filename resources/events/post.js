if(!me) cancel("You must be logged", 401);
if(me.role != 'site') cancel("You must be a disco user", 401);

var self = this;
var _ = require('underscore');

protect('users');

var isOwner = function(disco){
    return _.contains(me.sites, disco);
};

if(!isOwner(self.idDisco)){
    cancel("You must own this site", 400);
}

dpd.sites.put(self.idDisco, {events: {$push: self.id}}, function(res, err){
    cancelIf(err, err, 500);
});




