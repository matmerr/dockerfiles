#kibana

FROM debian:jessie
MAINTANER mmerrick

ENV KIBANA_VERSION 4.5

RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

RUN echo "deb http://packages.elastic.co/kibana/4.5/debian stable main" | sudo tee -a /etc/apt/sources.list
RUN apt-get update && apt-get install kibana