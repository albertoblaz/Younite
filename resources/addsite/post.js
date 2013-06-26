var site = parts[0];
if (!site) cancel("You must provide a site");
if (!me) cancel("You must be logged in");

dpd.sites.get(site, function(result, err) {
    cancelIf(err);
    dpd.users.put(me.id, {sites: {$push: site}}, function(result, err) {
        cancelIf(err);
        dpd.sites.put(site, {users: {$push: me.id}}, function(result, err) {
            cancelIf(err);
            dpd.notifications.post({agent : site, from : me, type : 'site', action : 'follow'}, function(res, err){
                console.log(err);
                cancelIf(err);
            });
        });
    });
});
