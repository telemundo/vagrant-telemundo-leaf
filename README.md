Developer Reference Manual
==========================
This repository contains the developer environment provisioning logic for `telemundo.com`.

## System requirements
Mac OS X or Linux capable of running VirtualBox. Windows hasn't been certified as a proper host environment for this cookbook. At least 4GB of available memory. Ruby 1.9.3 or higher. Git 1.7.1 or higher.

### Installation steps
Download this codebase inside of your `telemundo.com` working copy:

    git clone https://github.com/telemundo/vagrant-telemundo-leaf vagrant; cd vagrant

Install the required `ruby` dependencies:

    bundle install --path .bundle/gems

Verify that all requirements have been met:

    bundle exec rake check

If all checks pass, you can then continue with the creation of the VM by running:

    vagrant up

Make sure that the following line is inside of the `/etc/hosts` file:

    192.168.56.101 local.msnlatino.telemundo.com

Finally, visit [http://local.msnlatino.telemundo.com](http://local.msnlatino.telemundo.com) in your browser.

### Vagrant tips
Once the provisioning step is completed, you can login into the VM via SSH:

    $ vagrant ssh

If provisioning fails for any reason, you can pick up where it left off by running it again until it succeeds:

    $ vagrant provision

When you're not logged into the VM via SSH, it will still keep running, you can either stop it or destroy it to clean it up (note that destroying is perfectly OK, because your project files are not stored in the VM itself).

To delete your local VM:

    $ vagrant destroy -f

To stop it (can be started later again with `vagrant up`):

    $ vagrant halt

If you only want to run a single command within the VM, you can use:

    $ vagrant ssh -- [command]

For instance:

    $ vagrant ssh -- uptime

Read the official [documentation](http://docs.vagrantup.com/v2/cli/index.html) to learn more about Vagrant commands.
