var site = parts[0];
if (!site) cancel("You must provide a site");

dpd.users.put(me, {sites: {$pull: site}}, function(result, err) {
    if (err) cancel(err);
    dpd.sites.put(site, {users: {$pull: me.id}}, function(result, err) {
        if (err) cancel(err);
    });
});
