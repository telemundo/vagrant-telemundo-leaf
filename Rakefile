# -*- mode: ruby -*-
# vi: set ft=ruby ts=2 sw=2 :

require './lib/helper'
require 'erb'
require 'sem_ver'
require 'term/ansicolor'
include Term::ANSIColor

desc "Checks and configures your development environment."
task :check, :force do |t, args|
  args.with_defaults(:force => "true")
  force = !!args[:force].match(/^(true|t|yes|y|1)$/i)

  status_list = {
    :ok => green("ok"),
    :miss => red("missing"),
    :install => green("installed"),
    :fail => red("failed")
  }

  vagrant_min = SemVer.parse("1.6.2")
  vagrant_deps = ["vagrant-vbguest", "vagrant-bindfs"]
  vagrant = Kernel.system("which -s vagrant")
  if vagrant
    vagrant_current = `vagrant --version`.strip().match('([0-9]+)\.([0-9]+)\.([0-9]+)')
    vagrant_version = vagrant_current.nil? ? "0.0.0" : vagrant_current[0]
    version_check = SemVer.parse(vagrant_version) >= vagrant_min
    version_status = version_check ? green(vagrant_version) : red(vagrant_version)
    puts bold("==> rake: Checking vagrant version...")
    puts " %s: %s" % ["version", version_status]
    if version_check
      puts bold("==> rake: Checking vagrant plugins...")
      vagrant_plugins = `vagrant plugin list`.split( /\r?\n/ ).map{ |s| s.match('[a-z\-]+')[0] }
      vagrant_deps.each do |plugin|
        plugin_check = vagrant_plugins.include?(plugin)
        if !plugin_check and force
          Kernel.system("vagrant plugin install #{plugin}")
          plugin_status = $?.success? ? :install : :fail
        else
          plugin_status = plugin_check ? :ok : :miss
        end
        puts " %s: %s" % [plugin, status_list[plugin_status]]
      end
    else
      puts "You must install vagrant #{vagrant_min} or higher to continue."
    end
  else
    puts bold("==> rake: Checking system requirements...")
    puts "You must have vagrant installed to continue."
  end
end
