# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
#  config.vm.box = "bmcgonigle/centos68"
  config.vm.box = "centos/7"
  config.vm.network "forwarded_port", guest: 2181, host: 2181

  config.vm.provision "shell",
    path: "./provision.sh"

end
