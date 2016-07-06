#logstash

FROM debian:jessie
MAINTAINER mmerrick

EXPOSE 9995
EXPOSE 9999

RUN apt-get update
RUN apt-get install -y wget \
    curl

RUN mkdir /opt/jdk
COPY build-jdk.sh /opt/jdk/
RUN /opt/jdk/build-jdk.sh

RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elastic.co/logstash/2.0/debian stable main" | tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y \
    logstash

COPY config/*.conf /etc/logstash/conf.d/

RUN mkdir /opt/logstash/bin/codecs
COPY codecs/*.yaml /opt/logstash/bin/codecs/

COPY start.sh /opt/logstash/bin/start.sh

CMD ["/bin/bash", "/opt/logstash/bin/start.sh"]
