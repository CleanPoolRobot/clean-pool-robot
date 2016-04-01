Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

  config.vm.provision "fix-no-tty", type: "shell" do |shell|
    shell.privileged = false
    shell.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end

  config.vm.provision "initial-config", type: "shell" do |shell|
    shell.privileged = false
    shell.inline = "sudo apt-get update"
    shell.inline = "sudo apt-get install g++ -y && sudo apt-get install gcc -y"
  end

end
