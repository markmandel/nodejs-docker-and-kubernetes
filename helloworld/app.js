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

var server = app.listen(8080, function () {
    var host = server.address().address;
    var port = server.address().port;

    console.log('Hello World app started: http://%s:%s', host, port);
});