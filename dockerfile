FROM ubuntu:22.04
RUN mkdir ./app
RUN apt update
RUN apt install vim -y
RUN apt install openjdk-11-jdk -y
RUN apt install unzip -y
ADD https://hyperledger.jfrog.io/ui/native/besu-binaries/besu/21.10.9/besu-21.10.9.zip .
