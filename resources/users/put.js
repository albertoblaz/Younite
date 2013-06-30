
if(!internal){
    if(!me) cancel("You must be logged", 401);
    cancelUnless(me.role === 'user', "You must be a user", 401);
    cancelUnless(isMe(this.id), "You are not authorized to edit this user", 401);
    protect('friends');
    protect('sites');
    protect('events');
    protect('activity');
}

protect('role');
protect('timeline');

var _ = require('underscore');
