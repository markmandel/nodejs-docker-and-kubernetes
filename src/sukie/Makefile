#
# Makefile for this application
#

PROJECT=connect-js
TAG_VERSIOM=0.1
TAG=gcr.io/$(PROJECT)/sukie:$(VERSION)
NAME=node-sukie
PORT=8080

# build the docker image
build: deps
	docker build --tag=$(TAG) .

# push the docker image up to the Google Container repository
push:
	gcloud docker push $(TAG)

# install all the node dependencies
deps:
	npm install

# run the nodejs application
serve:
	npm start

serve-docker:
	docker run --rm -p=8080 --name=$(NAME) $(TAG)

stop-docker:
	docker stop $(NAME)

# Open Chrome up to the right exposed port from the docker shell.
chrome:
	google-chrome http://localhost:$(word 2,$(subst :, ,$(shell docker port $(NAME) $(PORT))))