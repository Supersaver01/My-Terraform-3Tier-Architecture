module "finance_instance" {
    source = "../ec2-module"
    instance_type = "t2.micro"
    instance_count = 2 #For 2 instance creation
    vpc_id = "vpc-08f2b7c74afdd3737"
    subnet_id = "subnet-054fd6210e82fd90a"
    security_group = "demo-sg-for-module"
    instance_name = "FinanceInstance"
    environment = "Dev"
  
}

module "sales_instance" {
    source = "../ec2-module"
    instance_type = "t2.micro"
    instance_count = 1 #For 2 instance creation
    vpc_id = "vpc-08f2b7c74afdd3737"
    subnet_id = "subnet-02c988cfd95814cd5"
    security_group = "demo-sg-for-module2"
    instance_name = "SalesInstance"
    environment = "Dev"
  
}