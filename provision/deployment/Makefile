#
# Makefile for deploying services up to Kubernetes
#

PROJECT=$(shell gcloud config list project | awk 'FNR ==2 { print $$3 }')
RESIZE=5
RC=web-v1

create: create-service create-rc

create-service:
	kubectl create -f sukie-service.yml

create-rc:
	CONTENT=$$(sed 's/$${PROJECT}/$(PROJECT)/g' web-replicationcontroller.yml) && \
		echo "$$CONTENT"  && \
		echo "$$CONTENT" | kubectl create -f -

resize:
	kubectl scale rc $(RC) --replicas=$(RESIZE)

update:
	sed 's/$${PROJECT}/$(PROJECT)/g' web-replicationcontroller-update.yml | kubectl create -f -kubectl rolling-update $(RC) --update-period="1s" -f -

clean:
	kubectl delete rc --all
	kubectl delete service --all

watch:
	watch -n 1 kubectl get pods