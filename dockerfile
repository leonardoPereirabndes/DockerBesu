FROM ubuntu:22.04
RUN mkdir ./app
RUN apt update
RUN apt install vim -y
