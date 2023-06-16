variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "subnet" {
  type = string
}

variable "security_group" {
  type = string
}

variable "path" {
  default = "/home/bapun/demo.pem"
  type = string
}
