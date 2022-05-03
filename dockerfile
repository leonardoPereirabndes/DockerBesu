FROM ubuntu:22.04
RUN mkdir ./app
RUN apt update
RUN apt install vim -y
RUN apt install openjdk-11-jdk -y
