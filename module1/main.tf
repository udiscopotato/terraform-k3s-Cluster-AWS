resource "aws_instance" "master" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet
  security_groups = [var.security_group]

  tags = {
    Name = "master"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install docker.io -y",
      "sudo curl -sfL https://get.k3s.io | sh -",
      "sudo cat /var/lib/rancher/k3s/server/node-token",
      "ip addr show eth0"
    ]
  }

  connection {
    type        = "ssh"
    host        = aws_instance.master.public_ip
    user        = "ubuntu"
    private_key = file(var.path)
  }

}


