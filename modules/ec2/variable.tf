variable subnets {
  type = list(string)
  description = "valid subnets to assign to server"
}

variable security_groups {
  type = list(string)
  description = "security groups to assign to server"
  default = []
}

variable "webInstance_ami" {
  type = string
}

variable "webInstance_type" {
  type = string
}
