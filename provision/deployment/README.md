Deployment of Containers to Kubernetes
======================================

## Watch the Cluster State

Running the following will give you a live view of the pods and services that are
currently active on the Kubernetes cluster

```bash
make watch
```

## Create the initial Replication Controller and Service

This will deploy sukie:0.1 to Kubernetes, and set up 3 instances of the container across the cluster.

```bash
make create
```

## Scale sukie:0.1

To increase the number of sukie:0.1 instances to 5:

```bash
make resize
```

## Update to sukie:0.2

To do a rolling update to sukie:0.2, run:

```bash
make update
```