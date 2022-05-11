FROM ubuntu:22.04
RUN mkdir ./app && mkdir ./Node
RUN mkdir ./Node/config && mkdir ./Node/data
RUN apt update
RUN apt install vim -y
RUN apt install openjdk-11-jdk -y
RUN apt install unzip -y
ADD https://hyperledger.jfrog.io/ui/api/v1/download?repoKey=besu-binaries&path=besu%2F21.10.9%2Fbesu-21.10.9.zip ./besu-21.10.9.zip
ADD https://hyperledger.jfrog.io/ui/api/v1/download?repoKey=besu-binaries&path=besu%2F22.4.0%2Fbesu-22.4.0.zip ./besu-22.4.0.zip
RUN unzip besu-21.10.9.zip
RUN unzip besu-22.4.0.zip
RUN cd /usr/bin && ln -s /besu-21.10.9/bin/besu besu
WORKDIR /Node
RUN besu --data-path=config public-key export-address --to=config/nodeAddress
