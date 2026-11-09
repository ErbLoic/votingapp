Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.synced_folder "./", "/vagrant"

  # Installe Docker sur chaque machine au premier démarrage
  config.vm.provision "shell", inline: <<-SHELL
    curl -fsSL https://get.docker.com | sh
    usermod -aG docker vagrant
  SHELL

  nodes = {
    "manager" => { ip: "192.168.99.10", mem: 2048 },
    "worker1" => { ip: "192.168.99.11", mem: 1024 },
    "worker2" => { ip: "192.168.99.12", mem: 1024 },
  }

  nodes.each do |name, opts|
    config.vm.define name do |node|
      node.vm.hostname = name
      node.vm.network "private_network", ip: opts[:ip]
      node.vm.provider "vmware_desktop" do |v|
        v.vmx["memsize"] = opts[:mem].to_s
        v.vmx["numvcpus"] = "2"
      end
    end
  end
end