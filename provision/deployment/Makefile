#
# Makefile for deploying services up to Kubernetes
#

PROJECT=$(shell gcloud config list project | awk 'FNR ==2 { print $$3 }')
RESIZE=5
RC=web-v1

# Create the Service and Replication Controller
create: create-service create-rc

# Create the Service
create-service:
	kubectl create -f sukie-service.yml

# Create the Replication Controller
create-rc:
	@cp web-replicationcontroller.yml /tmp/
	@sed -i 's/$${PROJECT}/$(PROJECT)/g' web-replicationcontroller.yml
	kubectl create -f web-replicationcontroller.yml
	@cp /tmp/web-replicationcontroller.yml .

# Resize the Replication Controller to 5 instances
resize:
	kubectl scale rc $(RC) --replicas=$(RESIZE)

# Do a rolling update to sukie:0.2
update:
	@cp web-replicationcontroller-update.yml /tmp/
	@sed -i 's/$${PROJECT}/$(PROJECT)/g' web-replicationcontroller-update.yml
	kubectl rolling-update $(RC) --update-period="1s" -f web-replicationcontroller-update.yml
	@cp /tmp/web-replicationcontroller-update.yml .

# Delete the Service and Replication Controllers
clean:
	kubectl delete rc --all
	kubectl delete service --all

# Watch the currently active pods
watch:
	watch -n 1 "echo 'PODS:' && kubectl get pods && \
		echo '---' '\nSERVICES:' && kubectl get service && \
		echo --- '\nREPLICATION CONTROLLERS:' && kubectl get rc"

# start the visualiser
visualise:
	-killall tinyproxy
	tinyproxy -c tinyproxy.conf
	kubectl proxy --www=/home/$(shell whoami)/gcp-live-k8s-visualizer --www-prefix=/static/ --api-prefix=/api/