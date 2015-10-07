FROM mhart/alpine-node:base

RUN mkdir /project
WORKDIR /project

COPY app.js app.js
COPY node_modules node_modules
COPY public public
COPY views views

ENTRYPOINT ["node", "app.js"]