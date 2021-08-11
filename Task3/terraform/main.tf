provider "aws" {
  region  = "eu-central-1"
  profile = "MyAWS"
}

module "networking" {
  source    = "./modules/networking"
  #namespace = var.namespace
}

#### Ubuntu server
resource "aws_instance" "web-server" {
  ami           = "ami-0b1deee75235aa4bb"
  instance_type = "t2.micro"
  key_name      = "webserver-key"
  subnet_id     = module.networking.vpc.public_subnets[0]
  vpc_security_group_ids  = [module.networking.sg_pub_id]
  user_data = "${file("installweb.sh")}"
  tags = {
    Name = "Ubuntu-server"
  }
}

  #### CentOS server
resource "aws_instance" "centos-server" {
  ami           = "ami-0005dd1bdf84d89d0"
  instance_type = "t2.micro"
  key_name      = "webserver-key"
  subnet_id     = module.networking.vpc.private_subnets[0]
  vpc_security_group_ids  = [module.networking.sg_priv_id]
  #user_data     = "${file("installweb.sh")}"
  tags = {
    Name = "CentOS7-server"
  }

}