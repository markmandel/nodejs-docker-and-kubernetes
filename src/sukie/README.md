# Sukie the NodeJS Application

A web application that shows pictures of my dog, Sukie.

There are two versions of it, 0.1 that has one photo, and 0.2 that has several.

## To build and deploy the sukie:01 image

```bash
make build
make push
```

# To build and deploy the sukie:0.2 image

Edit app.js from:

```node
app.get('/', function(req, res) {
    res.render("index");
})
```

to

```node
app.get('/', function(req, res) {
    res.render("index2");
})
```

Then to build the images and push them to Container Registry:

```bash
make build TAG_VERSION=0.2
make push TAG_VERSION=0.2
```