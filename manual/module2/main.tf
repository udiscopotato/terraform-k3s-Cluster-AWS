resource "aws_instance" "node" {
  count = 2

  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet
  security_groups = [var.security_group]

  tags = {
    Name = "node${count.index + 1}"
  }

  user_data = <<-EOF
  #!/bin/bash
  sudo apt update
  sudo apt install docker.io -y
  sudo curl -sfL https://get.k3s.io | K3S_URL=https://${var.master_ip}:6443 K3S_TOKEN=${var.master_token} sh - 
  EOF

}
