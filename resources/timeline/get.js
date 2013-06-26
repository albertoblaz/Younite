if(!me) cancelAll("You must be logged", 401);
if(!isMe(this.user)) cancelAll("Not allowed", 401);

var self = this;
var from = query.from || 0;
if(query.results){
    var results = (query.results > 50) ? 50 : query.results;
} else {
    var results = self.new;
}

var cutedTimeline = [];

for(var i=from, j=0; i<self.timeline.length && j<results; i++, j++){
    cutedTimeline.push(self.timeline[i]);
}

dpd.notifications.get({id : {$in : cutedTimeline}}, function(result, err){
    if(err) cancelAll("Internal server error", 500);
    self.timeline = result;
});

dpd.timeline.put(self.id, {new : 0}, function(res, err){
    cancelIf(err);
});