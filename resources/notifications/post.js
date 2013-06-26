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
if(me.friends){
    for(var i=0; i < me.friends.length; i++){
        arrayFunc.push(_pushId(me.friends[i]));
    }
    async.parallel(array, function(err, res){
        cancelIf(err);
    });
}