#logstash

FROM java:8-jre
MAINTAINER mmerrick

ENV LOGSTASH_VERSION 2.3

RUN apt-get update
RUN apt-get install -y wget \
    curl

RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elastic.co/logstash/$LOGSTASH_VERSION/debian stable main" | tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y \
    logstash

RUN ln -s /etc/logstash/conf.d /config

ENTRYPOINT ["/opt/logstash/bin/logstash", "-f", "/etc/logstash/conf.d"]
