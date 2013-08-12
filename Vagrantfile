# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"
    config.vm.host_name = "dabba-vagrant"
    config.ssh.forward_agent = true

    config.vm.provision :chef_solo do |chef|
        chef.add_recipe "apt"
        chef.add_recipe "dev-env"
        chef.add_recipe "dabba"
    end
end
