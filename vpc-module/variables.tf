#Var for VPC name
variable "vpc_name" {
  description = "Name of the VPC goes here"
  type        = string
}

#Variable for AZs
variable "azs" {
 type        = list(string)
 description = "Availability Zones"
 default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

#Variable for Subnets
variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

#Var for IGW Name
variable "igw" {
  description = "Name of the IGW goes here"
  type        = string
}

#Var for CIDR block 2nd RT
variable "second_rtb_cidr_block" {
  description = "Cidr block for the second rt"
  type        = string
  default     = "0.0.0.0/0" #You can set to default or leave as it is
}

#Var for Rt Name
variable "second_rt" {
  description = "Name of the RT goes here"
  type        = string
}