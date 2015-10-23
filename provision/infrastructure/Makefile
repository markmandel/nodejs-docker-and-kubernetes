#
# Makefile for managing the infrastructure
#

NAME=kubernetes-cluster
ZONE=us-central1-f
CONFIG=nodejs-k8s

# Create kubernetes cluster
deploy:
	gcloud deployment-manager deployments create $(NAME) --config cluster.yml

# Deletes entire deployment
clean:
	gcloud deployment-manager deployments delete $(NAME)

# Sets up a configuration called nodejs-k8s
# Switches to it, and configures the required properties
auth:
	gcloud config set container/cluster $(NAME)
	gcloud config set compute/zone $(ZONE)
	gcloud container clusters get-credentials $(NAME)