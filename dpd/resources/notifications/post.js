cancelUnless(me && internal, "You must be logged", 401);

var self = this;

protect('timestamp');
var timestamp = (new Date()).toString();
self.timestamp = timestamp;

dpd.users.get(this.from, function(user, err){
    cancelIf(err);
    if(user.friends){
      dpd.users.get({id : {$in : user.friends}}, function(users, err){
        cancelIf(err, err);
        console.log(users);
        for(var i=0; i < users.length; i++){
          dpd.timeline.put(users[i].timeline, {timeline : {$push : self.id}}, function(timeline,err){
              cancelIf(err, err);
          });
        }
      });
    }
});
