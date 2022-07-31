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

RUN echo "----- docker: env" && env | sort
RUN echo "----- docker: working directory is `pwd`"
RUN echo "----- docker: local directory, ls" && ls -ltra
RUN echo "----- docker: local space, du" && du . -h --max-depth=1
RUN echo "----- docker: whoami is `whoami`"
RUN echo "----- docker: user id is `id -u`"
RUN echo "----- docker: group id is `id -g`"
RUN echo "----- docker: creating a file" && touch docker-file-`date +"%y%m%d_%H%M%S"` && ls -ltra
RUN echo "----- docker: creating a directory" && mkdir docker-dir-`date +"%y%m%d_%H%M%S"` && ls -ltra
RUN echo "----- docker: npm: node modules" && npm list --depth=0
