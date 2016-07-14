FROM postgres:latest
MAINTAINER mmerrick

ENV EL_JEFE_VERSION 2.2


# install el-jefe dependencies and supervisor
RUN apt-get update && apt-get install -y wget \
    sudo \
    supervisor 

RUN apt-get -y install python-psycopg2 build-essential python-dev python-pip postgresql mongodb python-sqlalchemy python-bson python-dpkt python-jinja2 python-magic python-bottle python-pefile python-chardet

RUN pip install django==1.6 django-taggit django-bootstrap3==4.7.0 requests numpy pymongo==2.8.1 pycrypto


# create supervisor directories
RUN mkdir /var/log/supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN cd /opt/ && wget https://eljefe.immunityinc.com/eljefe/eljefe2.2.160622.release.tar.gz 
RUN cd /opt && tar -zxf eljefe* && rm *.tar.gz
RUN cd /opt/eljefe-*/webapp/

COPY start.sh /usr/bin/start.sh

# RUN export PHHOST=localhost &&\
#    etc/init.d/postgresql start &&\
#    ./opt/eljefe-*/webapp/install_ubuntu.sh

EXPOSE 8000 5555 5432
CMD bash -C '/usr/bin/start.sh';'bash'