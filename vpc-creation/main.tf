module "vpc-module" {
  source = "../vpc-module"

  vpc_name             = "tier-terraform-vpc"
  igw                  = "tierigw"
  second_rt            = "second-route-table"
  ## No public_subnet_cidrs specified, so default values will be used.
  #If you want to use a different configuration for azs and the likes please specify or uncomment the section below
  #azs                  = ["us-east-1a", "us-east-1b"]
  #public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  #private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
}
