module "nodes" {
        source = "../module2"
        ami             = ""
        instance_type   = ""
        key_name        = ""
        subnet       = ""
        security_group = ""
	master_ip = ""
	master_token = ""
}

