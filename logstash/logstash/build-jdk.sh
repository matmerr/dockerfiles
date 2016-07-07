#!/bin/bash
cd /opt/jdk
wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-x64.tar.gz
tar -zxf jdk-8u91-linux-x64.tar.gz

update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_91/bin/java 100
update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_91/bin/javac 100
