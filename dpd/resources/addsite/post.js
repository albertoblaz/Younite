var site = parts[0];
if (!site) cancel("You must provide a site");
if (!me) cancel("You must be logged in");

var _ = require('underscore');

cancelIf(_.contains(me.sites, site),"Already added",400);

var activity = {agent : site, timestamp : new Date(), type : 'site', action : 'follow'};
var notification = {agent : site, from : me.id, type : 'site', action : 'follow'};

dpd.sites.get(site, function(result, err) {
    cancelIf(err);
    dpd.users.put(me.id, {sites: {$push: site}, activity : {$push : activity}}, function(result, err) {
        cancelIf(err);
        dpd.sites.put(site, {users: {$push: me.id}}, function(result, err) {
            cancelIf(err);
            dpd.notifications.post(notification, function(res, err){
                cancelIf(err);
            });
        });
    });
});
