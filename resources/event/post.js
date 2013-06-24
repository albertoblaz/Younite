cancelUnless(me && internal, "You must be logged", 401);

protect('timestamp');
var timestamp = new Date();
this.timestamp = timestamp;