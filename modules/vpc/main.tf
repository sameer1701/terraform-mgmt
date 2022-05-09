module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "test-vpc-terraform"
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true
  one_nat_gateway_per_az = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
