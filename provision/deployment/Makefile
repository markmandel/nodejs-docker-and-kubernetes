#
# Makefile for deploying services up to Kubernetes
#

create:
	kubectl create -f helloworld-replicationcontroller.yml

clean:
	kubectl delete rc --all