#
# Makefile for deploying services up to Kubernetes
#

PROJECT=$(shell gcloud config list project | awk 'FNR ==2 { print $$3 }')
RESIZE=5

# Create the Service and Replication Controller
create: create-service apply-rs

# Create the Service
create-service:
	kubectl create -f sukie-service.yml

# Create the Replica Set Deployment
apply-rs:
	@cp sukie-deployment.yaml /tmp/
	@sed -i 's/$${PROJECT}/$(PROJECT)/g' sukie-deployment.yaml
	kubectl apply -f sukie-deployment.yaml --record
	@cp /tmp/sukie-deployment.yaml .

# Resize the Replica Set to 5 instances
resize:
	kubectl scale deployment web --replicas=$(RESIZE)

update:
	kubectl edit deployment web --record

# Delete the Service and Replication Controllers
clean:
	kubectl delete deployments --all
	kubectl delete service --all

# Watch the currently active pods
watch:
	watch -n 1 "echo 'PODS:' && kubectl get pods && \
		echo '---' '\nSERVICES:' && kubectl get service && \
		echo --- '\nREPLICA SETS:' && kubectl get rs"

# start the visualiser
visualise:
	-killall tinyproxy
	tinyproxy -c tinyproxy.conf
	kubectl proxy --www=/home/$(shell whoami)/gcp-live-k8s-visualizer --www-prefix=/static/ --api-prefix=/api/