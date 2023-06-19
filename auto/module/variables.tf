variable "ami" {
  type = string
  default = "ami-053b0d53c279acc90"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "do"
}

variable "subnet" {
  type = string
  default = "subnet-04e831f340db3d83c"
}

variable "security_group" {
  type = string
  default = "sg-0c466ee05da4cd9a6"
}

variable "path" {
  type = string
  default = "/home/bapun/do.pem"
}

variable "token" {
  type = string
  default = "MyCustomTokenForK3s"
}

