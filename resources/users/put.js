if(!me) cancelAll("You must be logged", 401);
cancelUnless(isMe(this.id) || internal, "You are not authorized to edit this user", 401);

var self = this;
var _ = require('underscore');

if(!internal){
    protect('friends');
    protect('sites');
}

if(changed('sites')){
  this.sites = removeDups(this.sites);
}

function removeDups(vals){
    var actual = _.values(vals);
    return _.uniq(actual);
}

