data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

}

resource "aws_subnet" "private" {
  for_each = toset(var.subnet_cidr_priv_block)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  availability_zone       = element(var.azs, index(var.subnet_cidr_priv_block, each.value))
  map_public_ip_on_launch = false

  tags = {
    Name = "eks-private-subnet-${each.key}"
  }
}

resource "aws_subnet" "public" {
  for_each = toset(var.subnet_cidr_pub_block)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  availability_zone       = element(var.azs, index(var.subnet_cidr_pub_block, each.value))
  map_public_ip_on_launch = false

  tags = {
    Name = "eks-public-subnet-${each.key}"
  }
}

resource "aws_internet_gateway" "my_igw" {
  count  = coalesce(var.igw_attachment, false) ? 1 : 0
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.tags_all
  }
}