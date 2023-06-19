output "public-ip" {
	module.cluster.aws_instance.master.public_ip
}
