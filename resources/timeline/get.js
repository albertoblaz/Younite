if(!me) cancelAll("You must be logged", 401);
if(!isMe(this.user)) cancelAll("Not allowed", 401);

var from = query.from || 0;
if(query.results){
    var results = (query.results > 50) ? 50 : query.results;
} else {
    var results = this.new;
}

var cutedTimeline = [];
for(var i=from, j=0; i<this.timeline.length && j<results; i++, j++){
    cutedTimeline.push(this.timeline[i]);
}

this.timeline = cutedTimeline;
dpd.timeline.put(this.id, {new : 0}, function(res, err){
    cancelIf(err);
});