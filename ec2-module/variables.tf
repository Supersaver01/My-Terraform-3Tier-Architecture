#This describes the instance-type
variable "instance_type" {
  description = "This describes the instance-type"
  type        = string
}

#This describes the name of the instance
variable "instance_name" {
  description = "This describes the name of the instance"
  type        = string
}

#This describes the environment of the instance
variable "environment" {
  description = "Deployment environment for the EC2 instance"
  type        = string
}

#Variable for instance count
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}

#Variable for security group name
variable "security_group" {
  description = "define security group name"
  type        = string
}

#Variable for VPC
variable "vpc_id" {
  description = "The ID of the existing VPC"
  type        = string
}

#Var for Subnet
variable "subnet_id" {
  description = "The ID of the existing subnet"
  type        = string
}