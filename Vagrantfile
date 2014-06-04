# -*- mode: ruby -*-
# vi: set ft=ruby ts=2 sw=2 :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "telemundo/precise64-telemundo"

  config.vm.network "private_network", ip: "192.168.56.101"
  config.vm.network "forwarded_port", guest: 80, host: 8001
  config.vm.network "forwarded_port", guest: 9000, host: 9001

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "../", "/var/www", owner: "vagrant", group: "vagrant"

  config.vm.provider "virtualbox" do |vbox|
    vbox.name = "local.msnlatino.telemundo.com"
    vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
end
