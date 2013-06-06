if(!me) cancelAll("You must be logged", 401);
var _ = require('underscore');

var self = this;

if(!isAllowed()){
  hide('sites');
  hide('gender');
  hide('likes');
  hide('city');
} else{
  if(query.hasOwnProperty('getSites')){
    dpd.sites.get({id : {$in: self.sites}}, function(sites, error){
        self.sites = sites;
    });
  }
}

function isAllowed(){
    if(self.public) return true;
    if(isMe(self.id)) return true;
    if(_.contains(self.friends, me.id)) return true;
    return false;
}
