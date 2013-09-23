cancelUnless(me, "You must be logged", 401);
cancelUnless(isMe(this.id), "You must be a user", 401);

dpd.timeline.del(this.timeline, function(res, err){
    cancelIf(err);
});

dpd.users.put({id : {$in : friends}}, {friends : {$pull : this.id}});