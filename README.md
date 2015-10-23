NodeJS example with Kuberenetes
================================

This is a very simple example of running NodeJS on Kuberenetes.

It comes with several Makefiles for setup and teardown.

## Running the Code

Make sure you have a project value already set in your `gcloud` configuration, before using this.

To setup the initial infrastructure, see [provision/infrastructure](provision/infrastructure/README.md)

To create the Docker images associated with the examples, see [src/sukie](src/sukie/README.md)
 
To deploy the Docker images to Kubernetes, see [provision/deployment](provision/deployment/README.md)

## Docker Development Shell

This is a docker development shell with all the dependencies for this project that can 
be built via `make build` in the root directory.

To start the developer shell, use `make shell`. This has only been tested on Linux, YMMV.

## Licence
Apache 2.0

This is not an official Google product.