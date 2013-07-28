if(!me) cancelAll("You must be logged", 401);

var _ = require('underscore');
var self = this;

hide('username');
hide('role');

self.isFriend = _.contains(me.friends, self.id);

if(!isMe(this.id)){
    hide('timeline');
    hide('petitionsTo');
    hide('petitionsFrom');
}
if(!isAllowed()){
  hide('sites');
  hide('gender');
  hide('likes');
  hide('city');
  hide('friends');
  hide('activity');
} else{
  if(query.hasOwnProperty('getSites')){
    dpd.sites.get({id : {$in: self.sites}}, function(sites, error){
        self.sites = sites;
    });
  }
}
function isAllowed(){
    if(internal) return true;
    if(self.public) return true;
    if(isMe(self.id)) return true;
    if(_.contains(self.friends, me.id)) return true;
    return false;
}
