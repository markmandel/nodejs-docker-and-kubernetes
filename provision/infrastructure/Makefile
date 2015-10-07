#
# Makefile for managing the infrastructure
#

NAME=kubernetes-cluster

deploy:
	gcloud deployment-manager deployments create $(NAME) --config cluster.yml


clean:
	gcloud deployment-manager deployments delete $(NAME)