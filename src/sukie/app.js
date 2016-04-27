/*
 * Copyright 2015 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * App to show pictures of my dog, Sukie.
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
    res.render("index");
});

//get the port
var port = process.env.PORT || 8080;

var server = app.listen(port, function() {
    var host = server.address().address;
    var port = server.address().port;

    console.log('Sukie! started: http://%s:%s', host, port);
});