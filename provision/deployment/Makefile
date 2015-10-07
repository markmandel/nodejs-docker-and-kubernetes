#
# Makefile for deploying services up to Kubernetes
#

create:
	kubectl create -f web-replicationcontroller.yml
	kubectl create -f sukie-service.yml

clean:
	kubectl delete rc --all
	kubectl delete service --all