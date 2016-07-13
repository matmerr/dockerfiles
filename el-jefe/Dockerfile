FROM postgres:latest
MAINTAINER mmerrick

ENV EL_JEFE_VERSION 2.2


# install el-jefe dependencies and supervisor
RUN apt-get update && apt-get install -y wget \
    sudo \
    postgresql \
    postgresql-9.4 \ 
    postgresql-client-9.4 \
    postgresql-client-common \
    postgresql-common \
    supervisor 

# create supervisor directories
RUN mkdir /var/log/supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN cd /opt/ && wget https://eljefe.immunityinc.com/eljefe/eljefe2.2.160622.release.tar.gz 
RUN cd /opt && tar -zxf eljefe* && rm *.tar.gz
RUN cd /opt/eljefe-*/webapp/
RUN ./opt/eljefe-*/webapp/install_ubuntu.sh

EXPOSE 8000
CMD["/usr/bin/supervisord"]