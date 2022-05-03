FROM ubuntu:22.04
RUN mkdir ./app
RUN apt update
RUN apt install vim -y
RUN apt install openjdk-11-jdk -y
RUN apt install unzip -y
ADD  https://hyperledger.jfrog.io/ui/api/v1/download?repoKey=besu-binaries&path=besu%2F21.10.9%2Fbesu-21.10.9.zip ./besu-21.10.9.zip
RUN unzip besu-21.10.9.zip
