module "vpc" {
  source = "./modules/vpc"
  azs    = ["us-east-1a","us-east-1b"]
  cidr   = "10.0.0.0/16"
  private_subnets = slice(cidrsubnets("10.0.1.0/16",8,8,8,8),0,2)
  public_subnets  = slice(cidrsubnets("10.0.1.0/16",8,8,8,8),2,4)
}

module "ec2" {
  source = "./modules/ec2"
  webInstance_ami = "ami-0022f774911c1d690"
  webInstance_type = "t2.micro"
  security_groups = [module.vpc.security_group_public]
  subnets  = module.vpc.vpc_public_subnets
}

