variable "azs" {
  type = list(string)
}

variable "private_subnets" {
  type = list
}

variable "public_subnets" {
  type = list
}

variable "cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}
