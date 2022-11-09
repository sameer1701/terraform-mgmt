module "vpc" {
  source   = "./modules/vpc"
  vpc_name = var.vpc_name
  #azs    = aws.west1
  azs             = var.azs
  cidr            = var.cidr_range
  private_subnets = slice(cidrsubnets(var.cidr_range, 8, 8, 8, 8), 0, 2)
  public_subnets  = slice(cidrsubnets(var.cidr_range, 8, 8, 8, 8), 2, 4)
}

module "ec2" {
  source           = "./modules/ec2"
  webInstance_ami  = "ami-0022f774911c1d690"
  webInstance_type = "t2.micro"
  security_groups  = [module.vpc.security_group_public]
  subnets          = module.vpc.vpc_public_subnets
}

