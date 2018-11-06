FROM openjdk:12-alpine

RUN apk update

RUN apk add curl
RUN apk add bash
RUN apk add ca-certificates wget
RUN update-ca-certificates

RUN wget https://download.clojure.org/install/linux-install-1.9.0.397.sh
RUN chmod +x linux-install-1.9.0.397.sh
RUN sh linux-install-1.9.0.397.sh
RUN clojure -Sdescribe
