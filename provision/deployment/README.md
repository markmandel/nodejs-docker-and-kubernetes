Deployment of Containers to Kubernetes
======================================

## Watch the Cluster State

Running the following will give you a live view of the pods, replication controllers and services that are
currently active on the Kubernetes cluster

```bash
make watch
```

## Create the initial Replica Set and Service

This will deploy the `sukie:0.1` Docker image to Kubernetes, and start 3 instances of the container across the cluster,
and create the `sukie` service, which exposes these containers.

```bash
make create
```

## Scale sukie:0.1

To increase the number of `sukie:0.1` Docker container instances to 5:

```bash
make resize
```

## Update to sukie:0.2

To do a rolling update to Docker image `sukie:0.2`, run:

```bash
make update
```

This will allow you to edit the yaml for this Replica Set. Change the image to `sukie:0.2`
in the yaml, save the file and exit the editor.