# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu-server-10.04-lts-x86_64"
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/37751086/vagrant/ubuntu-server-10.04-lts-x86_64.box"

  config.vm.network "private_network", ip: "192.168.56.101"

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "../", "/vagrant-nfs", type: "nfs", mount_options: ["rw", "sync", "noatime"]

  config.bindfs.bind_folder "/vagrant-nfs", "/var/www/telemundo", :create_as_user => true, :owner => "vagrant", :group => "vagrant"

  config.vm.provider "virtualbox" do |vbox|
    vbox.customize ["modifyvm", :id, "--memory", "768"]
    vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
end
