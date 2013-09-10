var express = require('express');
var app = express();

// log requests
app.use(express.logger('dev'));

// express on its own has no notion
// of a "file". The express.static()
// middleware checks for a file matching
// the `req.path` within the directory
// that you pass it. In this case "GET /js/app.js"
// will look for "./public/js/app.js".

app.use(express.static(__dirname));

// any routes are hit:
app.use(app.router);

app.listen(8000);
