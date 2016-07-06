#logstash

FROM debian:jessie
MAINTAINER mmerrick

EXPOSE 9995
EXPOSE 9999

RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y \
    curl \
    openjdk-8-jre \
    logstash

RUN mkdir /etc/logstash/conf.
COPY config/* /etc/logstash/conf/

RUN mkdir /opt/logstash/bin/codecs
COPY codecs/*.yaml /opt/logstash/bin/codecs/

COPY init.d/logstash /etc/init.d/logstash   #init for one logstash pipeline per config
RUN systemctl enable logstash.service
RUN systemctl daemon-reload