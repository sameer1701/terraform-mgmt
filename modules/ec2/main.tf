resource "random_shuffle" "subnets" {
  input = var.subnets
  result_count = 1
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "webserver-terraform"

  ami                    = var.webInstance_ami
  instance_type          = var.webInstance_type
  monitoring             = true
  vpc_security_group_ids = var.security_groups
  subnet_id              = random_shuffle.subnets.result[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
