# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantのバージョンをひとまず1.8.5としておく
Vagrant.require_version "= 1.8.5"

VAGRANTFILE_API_VERSION = 2
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # https://docs.vagrantup.com

  # すべてのマシンで同じ鍵を使う
  config.ssh.insert_key = false
  # config.vm.synced_folder "host_path", "guest_path"
  config.vm.synced_folder ".", "/vagrant"
  # ボックスのアップデートチェック
  config.vm.box_check_update = false

  config.vm.define "vagrant1" do |vagrant1|
    vagrant1.vm.box = "ARTACK/debian-jessie"
    #vagrant1.vm.network "forwarded_port", guest: 22, host: 2222
    vagrant1.vm.network "forwarded_port", guest: 80, host: 8080
    vagrant1.vm.network "forwarded_port", guest: 443, host: 8443
  end
  config.vm.define "vagrant2" do |vagrant2|
    vagrant2.vm.box = "ARTACK/debian-jessie"
    #vagrant2.vm.network "forwarded_port", guest: 22, host: 2223
    vagrant2.vm.network "forwarded_port", guest: 80, host: 8081
    vagrant2.vm.network "forwarded_port", guest: 443, host: 8444
  end
  config.vm.define "vagrant3" do |vagrant3|
    vagrant3.vm.box = "ARTACK/debian-jessie"
    #vagrant3.vm.network "forwarded_port", guest: 22, host: 2224
    vagrant3.vm.network "forwarded_port", guest: 80, host: 8082
    vagrant3.vm.network "forwarded_port", guest: 443, host: 8445
  end

end
