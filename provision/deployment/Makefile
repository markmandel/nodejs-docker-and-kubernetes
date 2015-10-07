#
# Makefile for deploying services up to Kubernetes
#

create:
	kubectl create -f helloworld-replicationcontroller.yml
	kubectl create -f helloworld-service.yml

clean:
	kubectl delete rc --all
	kubectl delete service --all