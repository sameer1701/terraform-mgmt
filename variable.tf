variable "ami" {
  default = "amazon"
}

variable "instance-type" {
  default = "t2.micro"
}

variable "vpc_name" {
  default = "test_vpc_terraform"
}

variable "cidr_range" {
  default = "10.0.0.0/16"
}

variable "azs" {
  default = ["us-east-1a", "us-east-1b"]
}
