#
# Makefile for building and developing this project
# This was built for development on Linux. YMMV on other OS's.
#

PROJECT=$(shell gcloud config list project | awk 'FNR ==2 { print $$3 }')
TAG=nodejs-k8s-dev
NAME=nodejs-k8s-dev
# where the ssh port is redirected
SSH_PORT=$(word 2,$(subst :, ,$(shell docker port $(NAME) 22)))
#the id of the docker group
DOCKER_GID=$(word 3,$(subst :, ,$(shell getent group docker)))
#default web port
PORT=8080

#
# Host targets
#

# Build the dev docker image
build:
	docker build --tag=$(TAG) dev
	notify-send "$(TAG) build complete"

# Start the developer shell
shell:
	mkdir -p ~/.config/gcloud
	mkdir -p `pwd`/.kube
	docker run --rm \
		--name=$(NAME) \
		-p=8001:8001 \
		-P=true \
		-e TERM \
		-e HOST_GID=`id -g` \
		-e HOST_UID=`id -u` \
		-e HOST_USER=$(USER) \
		-e DOCKER_GID=$(DOCKER_GID) \
		-v ~/.config/gcloud:/home/$(USER)/.config/gcloud \
		-v ~/.appcfg_oauth2_tokens:/home/$(USER)/.appcfg_oauth2_tokens \
		-v `pwd`/.kube:/home/$(USER)/.kube \
		-v `pwd`/dev/zshrc:/home/$(USER)/.zshrc \
		-v `pwd`/dev/zshrc:/home/$(USER)/.zshrc \
		-v /usr/bin/docker:/usr/bin/docker \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v `pwd`:/project \
		-it $(TAG) /root/startup.sh

# Attach a new terminal to an already running dev shell
shell-attach:
	docker exec -it --user=$(USER) $(NAME) zsh

# Attach a root terminal to an already running dev shell
shell-attach-root:
	docker exec -it $(NAME) bash

# Clean up the dev docker image
clean:
	docker rmi $(TAG)

# Open Chrome up to the right exposed port from the docker shell.
chrome:
	google-chrome http://localhost:$(word 2,$(subst :, ,$(shell docker port $(NAME) $(PORT))))

# show what your project is. Useful debugging.
project:
	echo $(PROJECT)

#
# Dev shell targets
#

# Push this docker image up to Google Container Repository
push:
	gcloud docker push $(TAG)

# Pull this docker image down from Google Container Repository
pull:
	gcloud docker pull $(TAG)

# Mounts the directories through sshfs to give access to dependencies
mount:
	mkdir -p /tmp/$(NAME)
	sshfs $(USER)@0.0.0.0:/ /tmp/$(NAME) -p $(SSH_PORT) -o follow_symlinks

# Run all the nodejs applications
serve:
	cd src/helloworld && make serve &

# shuts down all node processes
serve-kill:
	ps aux | grep node | awk '{print $$2}' | xargs kill

# start the visualiser
visualise:
	kubectl proxy --www=/home/$(USER)/gcp-live-k8s-visualizer --www-prefix=/static/ --api-prefix=/api/