#
# Makefile for deploying services up to Kubernetes
#

RESIZE=3
RC=web-v1

create:
	kubectl create -f web-replicationcontroller.yml
	kubectl create -f sukie-service.yml

resize:
	kubectl scale rc $(RC) --replicas=$(RESIZE)

update:
	kubectl rolling-update $(RC) --update-period="1s" -f web-replicationcontroller-update.yml

clean:
	kubectl delete rc --all
	kubectl delete service --all

watch:
	watch -n 1 kubectl get pods