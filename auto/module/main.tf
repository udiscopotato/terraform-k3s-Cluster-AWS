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
      "curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=\"v1.25.5+k3s1\" sh -s - server --token=MyCustomTokenForK3s"
    ]
  }

  connection {
    type        = "ssh"
    host        = aws_instance.master.public_ip
    user        = "ubuntu"
    private_key = file(var.path)
  }

}

resource "aws_instance" "nodes" {
  count = 2

  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet
  security_groups = [var.security_group]

  tags = {
    Name = "node-${count.index + 1}"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu" 
    private_key = file(var.path)
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION='v1.25.5+k3s1' sh -s - agent --server https://${aws_instance.master.private_ip}:6443 --token=MyCustomTokenForK3s"
    ]
  }
}
