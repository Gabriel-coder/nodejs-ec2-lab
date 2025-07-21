resource "aws_subnet" "private_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = "${var.environment}-private-1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = "${var.region}b"
  tags = {
    Name = "${var.environment}-private-2"
  }
}

resource "aws_subnet" "public_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_1_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-public-1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_2_cidr
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-public-2"
  }
}
