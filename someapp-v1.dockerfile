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
# v1
# copy source into container.
# run via ENTRYPOINT in docker image.
#
COPY package.json .
COPY package-lock.json .
COPY *.js .
COPY *.properties .
RUN npm install
ENTRYPOINT ["npm", "run-script", "sb-sonar-scanner"]
