# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.box = "bmcgonigle/centos68"

  # config.vm.box_check_update = false

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # config.vm.network "private_network", ip: "192.168.33.10"

  # config.vm.network "public_network"

  # config.vm.synced_folder "../data", "/vagrant_data"

  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
 
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  config.vm.provision "shell", inline: <<-SHELL
    yum update
    yum install -y vim
    mkdir /opt/jdk
    cd /vagrant/
    if [ -f "/vagrant/jdk-8u111-linux-x64.tar.gz" ]
    then
      echo "jdk-8u111-linux-x64.tar.gz exists"
    else
      wget --no-cookies --no-check-certificate \
       --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
       http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz
    fi 
    tar -zxf jdk-8u111-linux-x64.tar.gz -C /opt/jdk/
#    mv jdk1.8.0_111 /opt/jdk/
    echo "export JAVA_HOME=/opt/jdk/jdk1.8.0_111" >> ~/.bash_profile
    echo "export PATH=$PATH:/opt/jdk/jdk1.8.0_111/bin" >> ~/.bash_profile
    source ~/.bash_profile
    update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_111/bin/java 100 
  SHELL
end
