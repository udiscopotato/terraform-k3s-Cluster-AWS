module "nodes" {
        source = "../module2"
        ami             = "ami-053b0d53c279acc90"
        instance_type   = "t2.micro"
        key_name        = "demo"
        subnet       = "subnet-089815733d526489a"
        security_group = "sg-00a526c9587ac2176"
	master_ip = "172.31.88.209"
	master_token = "K10d1e7afb4c77727bf2063cbb224e8920ae30d7c857fb03bd695d53bb8c1a6feff::server:e66d1a18066d66dc0b7622da73a341ec"
}

