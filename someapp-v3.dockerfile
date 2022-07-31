#
# get latest version of v12 branch.
#
FROM node:12

WORKDIR /app

#
# install java
#
RUN echo "----- install java" && \
    apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean && \
    java -version && \
    echo "----- install java finished"
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN export JAVA_HOME

WORKDIR /app

#
# v3
# do not copy source, map drive.
# run via --entrypoint on commandline.
#
COPY package.json .
COPY package-lock.json .
RUN npm install
