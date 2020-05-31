# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Инструкция:
# Все настройки Vagrantfile должны выполняться исключительно через box MACHINES
# остальные разделы  конфигураций неприкосновенны, это сделано для автоматизации и упрощения чтения файлов
#
# конфигурация машины указывается через переменные "machine_"
#
# Provision: все провижн файлы для каждой машины должны располагаться в папке с именем самой виртуальной машины
#
# Agafonov Andrey, 2020
# @mailto: aagafonov@inbox.ru
#

# Определяем список машин ддя развертывания
MACHINES = {

  :nginx => {
    :box_name => "centos/7",
    :ip_addr => '172.20.1.10',
    :machine_cpu => '1',
    :machine_memory => '512',
    },
  :ticket1 => {
    :box_name => "centos/7",
    :ip_addr => '172.20.1.15',
    :machine_cpu => '2',
    :machine_memory => '2048',
    },
  :ticket2 => {
    :box_name => "centos/7",
    :ip_addr => '172.20.1.16',
    :machine_cpu => '2',
    :machine_memory => '2048',
    },
  :ticket3 => {
    :box_name => "centos/7",
    :ip_addr => '172.20.1.17',
    :machine_cpu => '2',
    :machine_memory => '2048',
    },

  :promsauron => {
    :box_name => "centos/7",
    :ip_addr => '172.20.1.220',
    :machine_cpu => '1',
    :machine_memory => '512',
  },

  ###################################
  :ansible => { #must be last
        :box_name => "centos/7",
        :ip_addr => '172.20.1.250',
        :machine_cpu => '1',
        :machine_memory => '512',
  }
}

Vagrant.configure("2") do |config|

  MACHINES.each do |boxname, boxconfig|

    config.vm.define boxname do |box|

        box.vm.box = boxconfig[:box_name]
        box.vm.host_name = boxname.to_s
        box.vm.network "private_network", ip: boxconfig[:ip_addr]

        box.vm.provider :virtualbox do |box|
            box.memory =  boxconfig[:machine_memory]
            box.cpus =    boxconfig[:machine_cpu]
            box.name =    boxname.to_s

        end
        #общий провижн, что применяется для всех тачек
        box.vm.provision "shell", inline: <<-SHELL
			    bash -x /vagrant/provision.sh
        SHELL

        case boxname.to_s
        when "ansible"
          provision_path = './' + boxname.to_s
          provision_script = provision_path +  '/provision.sh'
          provision_work_dir= '/vagrant/' + boxname.to_s
          provision_box_name= boxname.to_s
          box.vm.provision "shell", run: "always", inline: <<-SHELL
            bash -x /vagrant/ansible/provision.sh
          SHELL
        end
    end
  end
end

