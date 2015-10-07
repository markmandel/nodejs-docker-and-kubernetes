#
# Makefile for managing the infrastructure
#

NAME=kubernetes-cluster

# DOES NOT WORK
deploy:
	gcloud deployment-manager deployments create $(NAME) --config cluster.yml

# DOES NOT WORK
clean:
	gcloud deployment-manager deployments delete $(NAME)

# Used gcloud to spin up a kubernetes cluster with 3 nodes.
gcloud-deploy:
	gcloud container clusters create $(NAME) --zone us-central1-f --num-nodes 3

# set cluster and get the credentials for kubectl
auth:
	gcloud config set container/cluster $(NAME)
	gcloud container clusters get-credentials $(NAME)