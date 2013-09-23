// require deployd
var deployd = require('deployd');
var url = require('url');

/*var db_url = url.parse(
    process.env.MONGOHQ_URL || "mongodb://heroku_app16662768:ojq8onhcemca48uq3k0v3f67r6@ds033818.mongolab.com:33818/heroku_app16662768"
//"mongodb://:@ds033818.mongolab.com:33818/heroku_app16662768"

);*/

var options = {
    port: process.env.PORT || 5000,
    publicDir : './app',
    basepath : __dirname
 //   env: 'production',
    /*db: {
        "host": db_url.hostname,
        "port": parseInt(db_url.port),
        "name": db_url.pathname.slice(1)
    }*/
};

var server = deployd(options);

// heroku requires these settings for sockets to work

exports.init = function(){
  server.sockets.manager.settings.transports = ["xhr-polling"];

  // start the server
  server.listen();

  // debug
  server.on('listening', function() {
    console.log("Server is listening on port: " + options.port);
  });

  // Deployd requires this
  server.on('error', function(err) {
    console.error(err);
    process.nextTick(function() { // Give the server a chance to return an error
      process.exit();
    });
  });
}

