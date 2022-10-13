# -*- mode: ruby -*-
# vi: set ft=ruby :

box = "ubuntu/focal64"

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt install vim -y

    sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev -y
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source ~/.bashrc
    rbenv install 2.7.4
    rbenv global 2.7.4

    # https://www.phusionpassenger.com/docs/advanced_guides/install_and_upgrade/nginx/install/oss/focal.html
    sudo apt-get install nginx
    sudo apt-get install -y dirmngr gnupg apt-transport-https ca-certificates 
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
    sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger focal main > /etc/apt/sources.list.d/passenger.list'
    sudo apt-get update
    sudo apt-get install -y libnginx-mod-http-passenger
    if [ ! -f /etc/nginx/modules-enabled/50-mod-http-passenger.conf ]; then sudo ln -s /usr/share/nginx/modules-available/mod-http-passenger.load /etc/nginx/modules-enabled/50-mod-http-passenger.conf ; fi
    sudo ls /etc/nginx/conf.d/mod-http-passenger.conf

    cat /vagrant/mod-http-passenger.conf > /etc/nginx/conf.d/mod-http-passenger.conf
    cat /vagrant/sites-available-default > /etc/nginx/sites-available/default
    cat /vagrant/sites-available-testapp > /etc/nginx/sites-available/testapp
    sudo ln -s /etc/nginx/sites-available/testapp /etc/nginx/sites-enabled/testapp
  SHELL

  config.vm.define 'node-01' do |node|
    node.vm.box = box
    node.vm.network "private_network", ip: "10.10.12.10"
    node.vm.hostname = "node-01"

    node.vm.provider "virtualbox" do |vb|
      # vb.memory = 2024
      # vb.cpus = 2
    end

    node.vm.provision "shell", inline: <<-SHELL
    # Shell provisioner
    SHELL
  end
end
