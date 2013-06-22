var site = parts[0];
if (!site) cancel("You must provide a site");
if (!me) cancel("You must be logged in");

dpd.sites.get(site, function(result, error) {
  if(!error){
    dpd.users.put(me, {sites: {$push: site}}, function(result, err) {
        if (err) cancel(err);
        dpd.sites.put(site, {users: {$push: me.id}}, function(result, err) {
            if (err) cancel(err);
        });
    });
  }
});
