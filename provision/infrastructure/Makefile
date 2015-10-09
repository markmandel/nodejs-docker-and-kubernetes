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

# set cluster and get the credentials for kubectl
auth:
	gcloud config set container/cluster $(NAME)
	gcloud container clusters get-credentials $(NAME)