FROM openjdk:12-alpine

RUN jlink -c --no-man-pages --no-header-files -G --module-path $JAVA_HOME/jmods --add-modules java.base,java.management,java.rmi,java.sql,java.naming --output /usr/bin/jre

FROM alpine:3.8

COPY --from=0 /usr/bin/jre /usr/bin/jre
ENV JAVA_HOME /usr/bin/jre

RUN apk update

RUN apk add curl
RUN apk add bash
RUN apk add ca-certificates wget
RUN update-ca-certificates

RUN wget https://download.clojure.org/install/linux-install-1.9.0.397.sh
RUN chmod +x linux-install-1.9.0.397.sh
RUN sh linux-install-1.9.0.397.sh
RUN clojure -Sdescribe
