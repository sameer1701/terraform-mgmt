resource "aws_security_group" "public" {
  vpc_id = module.vpc.vpc_id
  name = "public"
  description = "created by terraform allow-ssh"

  tags = {
    Name = "public"
  }
}

resource "aws_security_group_rule" "public_out" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.public.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "public_ssh" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.public.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "public_web" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.public.id
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group" "private" {
  vpc_id = module.vpc.vpc_id
  name = "allow-ssh"
  description = "created by terraform allow-ssh"

  tags = {
    Name = "private"
  }
}

resource "aws_security_group_rule" "private_out" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.private.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "private_ssh" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.private.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}

resource "aws_security_group_rule" "private_web" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.private.id
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = [module.vpc.vpc_cidr_block]
}
