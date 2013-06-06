var site = parts[0];
if (!site) cancel("You must provide a site");

dpd.sites.get(site, function(result, error) {
  if(!error){
    dpd.users.put(me, {sites: {$push: site}}, function(result, err) {
        if (err) cancel(err);
    });
  }
});
