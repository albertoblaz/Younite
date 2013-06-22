if(!me) cancel("You must be logged", 401);
cancelUnless(isMe(this.id) || internal, "You are not authorized to edit this user", 401);

var self = this;
var _ = require('underscore');

self.sites = removeDups(self.sites);

if(!internal){
    protect('friends');
    protect('sites');
}

function removeDups(vals){
    return _.uniq(vals);
}

