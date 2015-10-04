#
# Makefile for building and developing this project
# This was built for development on Linux. YMMV on other OS's.
#

TAG=gcr.io/nodejs-k8s/dev
NAME=nodejs-k8s-dev
# where the ssh port is redirected
SSH_PORT=$(word 2,$(subst :, ,$(shell docker port $(NAME) 22)))
#the id of the docker group
DOCKER_GID=$(word 3,$(subst :, ,$(shell getent group docker)))

# Build the dev docker image
build:
	docker build --tag=$(TAG) dev

# Clean up the dev docker image
clean:
	docker rmi $(TAG)

# Push this docker image up to Google Container Repository
push:
	gcloud docker push $(TAG)

# Pull this docker image down from Google Container Repository
pull:
	gcloud docker pull $(TAG)

# Start the developer shell
shell:
	mkdir -p ~/.config/gcloud
	docker run --rm \
		--name=$(NAME) \
		-P=true \
		-e TERM \
		-e HOST_GID=`id -g` \
		-e HOST_UID=`id -u` \
		-e HOST_USER=$(USER) \
		-e DOCKER_GID=$(DOCKER_GID) \
		-v ~/.config/gcloud:/home/$(USER)/.config/gcloud \
		-v ~/.appcfg_oauth2_tokens:/home/$(USER)/.appcfg_oauth2_tokens \
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

# Mounts the directories through sshfs to give access to dependencies
mount:
	mkdir -p /tmp/$(NAME)
	sshfs $(USER)@0.0.0.0:/ /tmp/$(NAME) -p $(SSH_PORT) -o follow_symlinks

# Run all the nodejs applications
serve:
	cd src/helloworld && make serve &
	wait