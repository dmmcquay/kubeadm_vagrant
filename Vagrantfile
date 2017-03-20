# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.configure(2) do |config|

  (1..2).each do |i|
    config.vm.define "n#{i}" do |s|
      s.ssh.forward_agent = true
      s.vm.box = "ubuntu/xenial64"
      s.vm.hostname = "n#{i}"
      s.vm.provision :shell, inline: "sed 's/127\.0\.0\.1.*n.*/172\.42\.42\.#{i} n#{i}/' -i /etc/hosts"
      s.vm.provision :shell, path: "scripts/install_k8s.sh"
      s.vm.network "private_network", ip: "172.42.42.#{i}", netmask: "255.255.255.0",
        auto_config: true,
        virtualbox__intnet: "k8s-net"
      s.vm.provider "virtualbox" do |v|
        v.name = "n#{i}"
        v.memory = 2048
        v.gui = false
      end
    end
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

end
