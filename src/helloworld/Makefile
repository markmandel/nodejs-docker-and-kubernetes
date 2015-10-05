#
# Makefile for this application
#

# Start the server and run it

TAG=gcr.io/nodejs-k8s/helloworld:0.1
NAME=node-helloworld

build: deps
	docker build --tag=$(TAG) .

deps:
	npm install

serve:
	npm start

serve-docker:
	docker run --rm --name=$(NAME) $(TAG)

stop-docker:
	docker stop $(NAME)