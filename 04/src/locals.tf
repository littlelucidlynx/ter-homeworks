locals {
  vms_ssh_root_key = "ubuntu:${file("~/.ssh/service-cloud-ssh.pub")}"
}
