#!/bin/bash
yum update
yum install -y vim screen
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
# Zookeeper
: <<'END'
if [ -f "/vagrant/zookeeper-3.4.9.tar.gz" ]
 then
  echo "zookeeper-3.4.9.tar.gz exists"
 else
  cd /vagrant/
  wget http://apache.claz.org/zookeeper/zookeeper-3.4.9/zookeeper-3.4.9.tar.gz
fi
tar -zxf /vagrant/zookeeper-3.4.9.tar.gz -C /opt/
cd /opt/zookeeper-3.4.9/
mkdir -p /opt/zookeeper-3.4.9/data
cp /vagrant/zoo.cfg /opt/zookeeper-3.4.9/conf/
#bin/zkServer.sh start &
END
if [ -f /vagrant/scala-2.11.8.rpm ]
    then
     echo "scala-2.11.8.rpm exists"
    else
     cd /vagrant
     wget http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.rpm
fi
cd /vagrant/
yum install /vagrant/scala-2.11.8.rpm -y
#    /bin/zkCli.sh #To start CLI
# Kafka
if [ -f "/vagrant/kafka_2.11-0.9.0.0.tgz" ]
 then
  echo "kafka_2.11-0.9.0.0.tgz exists"
 else
  cd /vagrant/
  wget http://mirror.olnevhost.net/pub/apache/kafka/0.9.0.0/kafka_2.11-0.9.0.0.tgz
fi
tar -zxf /vagrant/kafka_2.11-0.9.0.0.tgz -C /opt
cd /opt/kafka_2.11-0.9.0.0
bin/kafka-server-start.sh config/server.properties &
