# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu-server-10.04-lts-x86_64"

  config.vm.network "private_network", ip: "192.168.56.101"

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "../", "/vagrant-nfs", type: "nfs", mount_options: ["rw", "sync", "noatime"]

  config.bindfs.bind_folder "/vagrant-nfs", "/var/www/telemundo", :create_as_user => true, :owner => "vagrant", :group => "vagrant"

  config.vm.provider "virtualbox" do |vbox|
    vbox.customize ["modifyvm", :id, "--memory", "768"]
    vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file default.pp in the manifests_path directory.
  #
  # config.vm.provision "puppet" do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "site.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision "chef_solo" do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end
end
