if(!internal){
    cancelUnless(me && isMe(this.owner), "Unauthorized", 403);
    cancelUnless(me.role === 'site',"You must be a disco user", 401);
}
var _ = require('underscore');

protect('owner');

if(!internal){
 protect('users');
 protect('events');
}

this.users = removeDups(this.users);

function removeDups(vals){
    var actual = _.values(vals);
    return _.uniq(actual);
}



