provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "local" {
    path = "dev/vpc/terraform.tfstate"
  }
}

module "vpc" {
  source = "../modules/vpc"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.0.0/19"]
  public_subnets  = ["10.0.32.0/19"]

  private_subnet_tags = {
    "Name" = "gr18-private-subnet"
  }

  public_subnet_tags = {
    "Name" = "gr18-public-subnet"
  }
}

module "public_security_group" {
  source      = "../modules/sg"
  region      = "us-east-1"
  name        = "public-sg"
  description = "Public security group"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      from_port      = 22
      to_port        = 22
      protocol       = "tcp"
      cidr_blocks    = ["1.54.132.156/32"]
      security_groups = []
    }
  ]

  egress_rules = [
    {
      from_port      = 0
      to_port        = 0
      protocol       = "-1"
      cidr_blocks    = ["0.0.0.0/0"]
      security_groups = []
    }
  ]
}

module "private_security_group" {
  source      = "../modules/sg"
  region      = "us-east-1"
  name        = "private-sg"
  description = "Private security group"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      from_port      = 22
      to_port        = 22
      protocol       = "tcp"
      cidr_blocks     = []
      security_groups = [module.public_security_group.id]
    }
  ]
  egress_rules = [
    {
      from_port      = 0
      to_port        = 0
      protocol       = "-1"
      cidr_blocks    = ["0.0.0.0/0"]
      security_groups = []
    }
  ]
}

module "public_ec2" {
  source = "../modules/ec2"

  region            = "us-east-1"
  instance_type    = "t2.micro"
  key_name         = "tf_key"
  security_group_ids = [module.public_security_group.id]
  subnet_id        = module.vpc.public_subnet_ids[0]
  instance_name    = "Gr18-PublicEC2Instance"
  associate_public_ip_address = true
}

module "pirvate_ec2" {
  source = "../modules/ec2"

  region            = "us-east-1"
  instance_type    = "t2.micro"
  key_name         = "tf_key"
  security_group_ids = [module.private_security_group.id]
  subnet_id        = module.vpc.private_subnet_ids[0]
  instance_name    = "Gr18-PrivateEC2Instance"
}

