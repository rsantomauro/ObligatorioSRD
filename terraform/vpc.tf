resource "aws_vpc" "vpc_store" {
  cidr_block = "${var.cidr_block}0.0/16"

  tags = {
    Name        = "vpc_store"
    Terraform   = "yes"
  }
}

resource "aws_subnet" "dmz_private_subnet" {
  vpc_id            = aws_vpc.vpc_store.id
  cidr_block        = "${var.cidr_block}1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name        = "dmz_private_subnet"
    Terraform   = "yes"
  }
}

resource "aws_subnet" "bd_private_subnet" {
  vpc_id            = aws_vpc.vpc_store.id
  cidr_block        = "${var.cidr_block}2.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name        = "bd_private_subnet"
    Terraform   = "yes"
  }
}

resource "aws_subnet" "gestion_private_subnet" {
  vpc_id            = aws_vpc.vpc_store.id
  cidr_block        = "${var.cidr_block}3.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name        = "gestion_private_subnet"
    Terraform   = "yes"
  }
}

resource "aws_subnet" "siem_private_subnet" {
  vpc_id            = aws_vpc.vpc_store.id
  cidr_block        = "${var.cidr_block}4.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name        = "siem_private_subnet"
    Terraform   = "yes"
  }
}

resource "aws_subnet" "store_public_subnet" {
  vpc_id            = aws_vpc.vpc_store.id
  cidr_block        = "${var.cidr_block}10.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "Some Public Subnet"
    Terraform   = "yes"
  }
}

# Subnets
# Internet Gateway for Public Subnet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_store.id
  tags = {
    Name        = "igw"
    Terraform   = "yes"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_store.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "Store-public-route-table"
    Terraform   = "yes"
  }
}

resource "aws_route_table_association" "public_1_rt_a" {
  subnet_id      = aws_subnet.store_public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}