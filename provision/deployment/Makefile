#
# Makefile for deploying services up to Kubernetes
#

RESIZE=3

create:
	kubectl create -f web-replicationcontroller.yml
	kubectl create -f sukie-service.yml

resize:
	kubectl scale rc web --replicas=$(RESIZE)

clean:
	kubectl delete rc --all
	kubectl delete service --all