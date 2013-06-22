if(!me) cancelAll("You must be logged", 401);
if(me.role != 'site') cancel("You must be a disco user", 401);

var _ = require('underscore');

var isOwner = function(disco){
    return _.contains(me.sites, disco);
};

if(!isOwner(this.idDisco)){
    cancel("You must own this site", 400);
}

dpd.sites.put(this.idDisco, {events: {$push: this.id}}, function(res, err){
    cancelIf(err, err, 500);
});



