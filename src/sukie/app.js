/**
 * Simple helloworld application
 */

var express = require("express");
var morgan = require('morgan');

var app = express();
app.set("view engine", "jade");

//per request logging
app.use(morgan('combined'));

//static file serving
app.use(express.static('public'));


app.get('/', function(req, res) {
    res.render("index2");
})

//get the port
var port = process.env.PORT || 8080;

var server = app.listen(port, function() {
    var host = server.address().address;
    var port = server.address().port;

    console.log('Sukie! started: http://%s:%s', host, port);
});