# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "https://dumps.carroarmato0.be/vagrantboxes/centos-6.6-64b-puppet-vbox.box"

  config.vm.define "master01" do |master01|
    master01.vm.hostname = "master01.local"
    master01.vm.network "private_network", ip: "192.168.33.21"
  end

  config.vm.define "slave01" do |slave01|
    slave01.vm.hostname = "slave01.local"
    slave01.vm.network "private_network", ip: "192.168.33.22"
  end

  config.vm.define "slave02" do |slave02|
    slave02.vm.hostname = "slave02.local"
    slave02.vm.network "private_network", ip: "192.168.33.23"
  end

  # Clear firewall rules to allow intermachine communication
  config.vm.provision "shell", inline: "service iptables stop; chkconfig iptables off;"

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path     = "manifests"
    puppet.manifest_file      = "site.pp"
    puppet.module_path        = "modules"
    puppet.hiera_config_path  = "hiera.yaml"
    #puppet.options            = "--verbose --debug"
   end

end
