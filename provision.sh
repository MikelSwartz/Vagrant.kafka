#!/bin/bash
yum update
yum install -y vim screen telnet
# Java install and configure
if [ -f "/vagrant/jdk-8u111-linux-x64.tar.gz" ]
 then
  echo "jdk-8u111-linux-x64.tar.gz exists"
else
  cd /vagrant
  wget --no-cookies --no-check-certificate \
  --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
  http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz
fi 
mkdir -p /opt/jdk
tar -zxf /vagrant/jdk-8u111-linux-x64.tar.gz -C /opt/jdk/
echo "export JAVA_HOME=/opt/jdk/jdk1.8.0_111" >> ~/.bash_profile
echo "export PATH=$PATH:/opt/jdk/jdk1.8.0_111/bin" >> ~/.bash_profile
source ~/.bash_profile
update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_111/bin/java 100 

#scala
SCALA_VER="2.11.11"
if [ -f /vagrant/scala-${SCALA_VER}.rpm ]
    then
     echo "scala-${SCALA_VER}.rpm exists"
    else
     cd /vagrant
     wget https://downloads.lightbend.com/scala/${SCALA_VER}/scala-${SCALA_VER}.rpm

fi
cd /vagrant/
yum install /vagrant/scala-2.11.11.rpm -y

# Kafka
KAFKA_VER="0.11.0.0"
if [ -f "/vagrant/kafka_2.11-${KAFKA_VER}.tgz" ]
 then
  echo "kafka_2.11-${KAFKA_VER}.tgz exists"
 else
  cd /vagrant/
  wget http://apache.claz.org/kafka/${KAFKA_VER}/kafka_2.11-${KAFKA_VER}.tgz
fi
tar -zxf /vagrant/kafka_2.11-${KAFKA_VER}.tgz -C /opt
cd /opt/kafka_2.11-${KAFKA_VER}
bin/kafka-server-start.sh config/server.properties &
