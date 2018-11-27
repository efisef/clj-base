FROM openjdk:12-jdk

RUN jlink -c --no-man-pages --no-header-files -G --module-path $JAVA_HOME/jmods --add-modules java.base,java.management,java.rmi,java.sql,java.naming,jdk.unsupported --output /usr/bin/jre

FROM ubuntu:18.04

COPY --from=0 /usr/bin/jre /usr/bin/jre
ENV JAVA_HOME /usr/bin/jre

RUN apt-get update
RUN yes | apt-get install wget curl libc-dev gcc libssl-dev

RUN wget https://download.clojure.org/install/linux-install-1.9.0.397.sh
RUN chmod +x linux-install-1.9.0.397.sh
RUN bash linux-install-1.9.0.397.sh
RUN clojure -Sdescribe

