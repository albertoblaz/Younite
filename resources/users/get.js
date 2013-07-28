if(!me) cancelAll("You must be logged", 401);

var _ = require('underscore');
var self = this;

var SITES_FIELDS = ['id', 'name', 'picture', 'music'];
var FRIENDS_FIELDS = ['id', 'displayName', 'picture', 'birthdate', 'city'];
var EVENTS = ['id', 'name', 'siteName', 'siteIcon', 'going', 'date'];

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
        self.sites = _.map(sites, function(site){ return _.pick(site, SITES_FIELDS); });
    });
  }
  if(query.hasOwnProperty('getFriends')){
    dpd.users.get({id : {$in: self.friends}}, function(friends, error){
      self.friends = _.map(friends, function(friend){ return _.pick(friend, FRIENDS_FIELDS); });
    });
    dpd.users.get({id : {$in: self.petitionsFrom}}, function(froms, error){
      self.petitionsFrom = _.map(froms, function(from){ return _.pick(from, FRIENDS_FIELDS); });
    });
    dpd.users.get({id : {$in: self.petitionsTo}}, function(tos, error){
      self.petitionsTo = _.map(tos, function(to){ return _.pick(to, FRIENDS_FIELDS); });
    });
  }
  if(query.hasOwnProperty('getEvents')){
    dpd.events.get({id : {$in: self.events}}, function(events, error){
      self.events = _.map(events, function(event){return _.pick(event, EVENTS_FIELDS);});
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
