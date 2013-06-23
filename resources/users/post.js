
protect('sites');
protect('friends');
protect('events');
protect('role');
protect('timeline');

this.role = 'user';

dpd.timeline.post({this.id}, function(timeline, error){
    cancelIf(error);
    this.timeline = timeline.id;
});
