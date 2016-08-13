FROM mhart/alpine-node:latest

MAINTAINER zhuxiaoyan <redilove@gmail.com>

# Java
RUN apk add --no-cache openjdk8

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:$JAVA_HOME/bin

#install dependencies for node-java buidling and clean up
#install node-java module and move to global module find path
RUN apk add --no-cache python make gcc g++ && \
	npm install -g java && \
	mkdir ~/.node_modules && \
	mv /usr/lib/node_modules/java ~/.node_modules/java && \
	apk del python make gcc g++