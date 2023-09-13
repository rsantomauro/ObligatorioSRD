resource "aws_vpc" "vpc_store" {
  cidr_block = "${var.cidr_block}0.0/16"

  tags = {
    Name        = "vpc_store"
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

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_store.id

  tags = {
    Name        = "Store-public-route-table"
    Terraform   = "yes"
  }
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
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

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.dmz_private_subnet.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.gestion_private_subnet.id
  route_table_id = aws_route_table.public.id
}

#resource "aws_route_table_association" "private" {
#  count          = length(var.private_subnets_cidr)
#  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
#  route_table_id = aws_route_table.private.id
#}