# Task 3 Terraform
#### Task 3 Diagram
![Task3-diagram](img/Task3-diagram.png) 

## Task steps
### #1. I created new AWS profile on my PC
![AWS Profile](img/AWS-profile.png) 
### #2. Created new VPC on networking module
    data "aws_availability_zones" "available" {}

    module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name                             = "exadel-vpc"
    cidr                             = "10.0.0.0/16"
    azs                              = data.aws_availability_zones.available.names
    private_subnets                  = ["10.0.1.0/24"]
    public_subnets                   = ["10.0.2.0/24"]
    create_database_subnet_group     = true
    enable_nat_gateway               = true
    single_nat_gateway               = true
  
}
