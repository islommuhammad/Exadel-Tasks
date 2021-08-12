provider "aws" {
  region  = "eu-central-1"
  profile = "MyAWS"
}

data "aws_ami" "latest-ubuntu" {
most_recent = true
owners = ["099720109477"] 
  filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}

data "aws_ami" "centos" {
owners      = ["374168611083"]
most_recent = true

  filter {
      name   = "name"
      values = ["eu-central-1 image for x86_64 CentOS_7"]
  }

  filter {
      name   = "architecture"
      values = ["x86_64"]
  }

  filter {
      name   = "root-device-type"
      values = ["ebs"]
  }
}

module "networking" {
  source    = "./modules/networking"
}

#### Ubuntu server
resource "aws_instance" "web-server" {
  ami                     = data.aws_ami.latest-ubuntu.id
  instance_type           = "t2.micro"
  key_name                = "webserver-key"
  subnet_id               = module.networking.vpc.public_subnets[0]
  vpc_security_group_ids  = [module.networking.sg_pub_id]
  user_data               = "${file("installweb.sh")}"

  provisioner "file" {
    source      = "./centos-key.pem"
    destination = "/home/ubuntu/centos-key.pem"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("webserver-key.pem")
      host        = self.public_ip
    }
  }
  provisioner "remote-exec" {
    inline = ["chmod 400 ~/centos-key.pem"]

    connection {
     type         = "ssh"
      user        = "ubuntu"
      private_key = file("webserver-key.pem")
      host        = self.public_ip
    }

  }

  tags = {
    Name = "Ubuntu-server"
  }
}

  #### CentOS server
resource "aws_instance" "centos-server" {
  ami                         = data.aws_ami.centos.id
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  key_name                    = "centos-key"
  subnet_id                   = module.networking.vpc.private_subnets[0]
  vpc_security_group_ids      = [module.networking.sg_priv_id]
  
  tags = {
    Name = "CentOS7-server"
  }

}
