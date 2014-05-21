# -*- mode: ruby -*-
# vi: set ft=ruby ts=2 sw=2 :

require 'erb'

class Configurator
  attr_accessor :vbox_hostname
end

class Generator
  attr_accessor :config, :template
  def initialize(config, template)
    @config = config
    @template = template
  end
  def render
    ERB.new(File.read(@template)).result(binding)
  end
  def save(file)
    File.open(file, "w+") do |f|
      f.write(render)
    end
  end
end
