
if(!internal){
    if(!me) cancel("You must be logged", 401);
    cancelUnless(me.role === 'user', "You must be a user", 401);
    cancelUnless(isMe(this.id), "You are not authorized to edit this user", 401);
    protect('friends');
    protect('sites');
    protect('events');
}

protect('role');
protect('timeline');

console.log(changed(this.sites));
console.log('nuevas',this.sites);
var _ = require('underscore');



console.log(changed(this.sites));
