Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.box_check_update = false
    config.vm.synced_folder "shared/", "/shared", create: true
    config.vm.synced_folder "dataset/", "/dataset", create: true
    config.vm.network "forwarded_port", guest: 30000, host: 30000
    config.vm.network "forwarded_port", guest: 30001, host: 30001
    config.vm.network "forwarded_port", guest: 30002, host: 30002

    # ..
    config.vm.define "m102" do |server|
        # ..
        server.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--cpus", "2"]
            vb.name = "m102"
            vb.memory = 4096
        end
        # ..
        server.vm.hostname = "m102.mongodb.university"
        server.vm.network :private_network, ip: "192.168.14.100"
        server.vm.provision :shell, path: "provision-m102", args: ENV['ARGS']
    end
end
