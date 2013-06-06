var site = parts[0];
if (!site) cancel("You must provide a site");

dpd.users.put(me, {sites: {$pull: site}}, function(result, err) {
  
});