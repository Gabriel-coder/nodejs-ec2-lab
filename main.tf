module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  vpc_name   = "modular-vpc"
}

module "subnets" {
  source = "./modules/subnets"

  vpc_id      = module.vpc.vpc_id
  region      = "us-east-1"
  environment = "dev"

  private_subnet_1_cidr = "10.0.1.0/24"
  private_subnet_2_cidr = "10.0.2.0/24"
  public_subnet_1_cidr  = "10.0.101.0/24"
  public_subnet_2_cidr  = "10.0.102.0/24"
}

module "internet_gateway" {
  source = "./modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source              = "./modules/route-table"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.igw_id
  public_subnet_1_id  = module.subnets.public_subnet_1_id
  public_subnet_2_id  = module.subnets.public_subnet_2_id
  environment         = "dev"
}

module "security_group" {
  source     = "./modules/security-group"
  vpc_id     = module.vpc.vpc_id
  allowed_ports = [22, 3000]
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

module "ec2" {
  source             = "./modules/ec2"
  ami_id             = "ami-0c101f26f147fa7fd" # Substitua se for diferente
  instance_type      = "t2.micro"
  subnet_id          = module.subnets.public_subnet_1_id
  security_group_id  = module.security_group.security_group_id
  key_name           = "chave-rodrigo"

  tags = {
    Owner = "Rodrigo"
  }
}





