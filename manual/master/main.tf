module "master_node" {
	source = "../module1"
	ami             = ""   # image id
	instance_type   = ""   # instance type ex: t2.micro
	key_name        = ""  # keyname ex: key
	subnet       = ""  # subnet id 
	security_group = ""   # security group id
	path = ""   #absolute path of .pem file ex  /home/username/key.pem

}
