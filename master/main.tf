module "master_node" {
	source = "../module1"
	ami             = "ami-053b0d53c279acc90"
	instance_type   = "t2.small"
	key_name        = "demo"
	subnet       = "subnet-089815733d526489a"
	security_group = "sg-00a526c9587ac2176"

}
