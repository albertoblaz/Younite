cancelUnless(me && internal, "You must be logged", 401);

var async = require('async');
var self = this;

protect('timestamp');
var timestamp = new Date();
self.timestamp = timestamp;

var arrayFunc = [];

function _pushId(id){
    return function(cb){
        dpd.timeline.put(id, {timeline : {$push : self.id}}, function(timeline,err){
            console.log(err);
            errorIf(err);
            cb(err, res);
        });
    };
}

dpd.users.get(this.from, function(user, err){
    cancelIf(err);
    if(user.friends){
        for(var i=0; i < user.friends.length; i++){
            arrayFunc.push(_pushId(user.friends[i]));
        }
        async.parallel(array, function(err, res){
            cancelIf(err);
        });
    }
});