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