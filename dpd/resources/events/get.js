if(!me) cancelAll("You must be logged", 401);

var self = this;
var _ = require('underscore');

self.going = _.contains(me.events, self.id);

dpd.sites.get(self.idDisco, function(disco, err){
    self.siteName = disco.name;
    self.siteIcon = disco.icon;
});