var _ = require('underscore');

if(!this.public){
  hide('sites');
  hide('gender');
  hide('likes');
  hide('city');
} else{
  if(query.hasOwnProperty('getSites')){
    dpd.sites.get({id : {$in: this.sites}}, function(sites, error){
      this.sites = sites;
    });
  }
}
