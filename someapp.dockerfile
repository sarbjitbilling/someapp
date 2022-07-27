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
#
#COPY package.json .
#COPY package-lock.json .
#COPY *.js .
#COPY *.properties .
#RUN npm install
#ENTRYPOINT ["npm", "run-script", "sb-sonar-scanner"]

#
# v2
#
COPY package.json .
COPY package-lock.json .
COPY *.js .
COPY *.properties .
COPY *.sh .
RUN npm install

#
# v3
#
#COPY package.json .
#COPY package-lock.json .
#RUN npm install

RUN echo "----- docker: working directory is `pwd`"
RUN echo "----- docker: local directory, ls" && ls -ltra
RUN echo "----- docker: local space, du" && du . -h --max-depth=1
RUN echo "----- docker: npm: node modules" && npm list --depth=0
