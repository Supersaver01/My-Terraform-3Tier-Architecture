#Creates VPC
resource "aws_vpc" "tier_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.vpc_name
  }
}

#Creates Public and Private Subnets
resource "aws_subnet" "public_subnets" {
  count      = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.tier_vpc.id
  cidr_block = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count      = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.tier_vpc.id
  cidr_block = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}

#Creates Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.tier_vpc.id

  tags = {
    Name = var.igw
  }
}

# Create second route table for subnets association
#To make the subnets named “Public” public, we have to create routes using IGW
#which will enable the traffic from the Internet to access these subnets

resource "aws_route_table" "second_rtb" {
 vpc_id = aws_vpc.tier_vpc.id
 
 route {
   cidr_block = var.second_rtb_cidr_block # The default is "0.0.0.0/0" you can define your choice
   gateway_id = aws_internet_gateway.gw.id
 }
 
 tags = {
   Name = var.second_rt
 }
}

#Asscoiate public Subnets with the second route table
resource "aws_route_table_association" "public_route_asso" {
  count      = length(var.public_subnet_cidrs)
  subnet_id     = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.second_rtb.id

}