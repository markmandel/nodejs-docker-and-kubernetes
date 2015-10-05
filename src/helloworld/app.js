/**
 * Simple helloworld application
 */

var express = require("express");
var morgan = require('morgan');

var app = express();
app.use(morgan('combined'));

app.get('/', function(req, res) {
    res.send('{"foo": "bar"}');
});

//get the port
var port = process.env.PORT || 8080;

var server = app.listen(port, function () {
    var host = server.address().address;
    var port = server.address().port;

    console.log('Hello World app started: http://%s:%s', host, port);
});