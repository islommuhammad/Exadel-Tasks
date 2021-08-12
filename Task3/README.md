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
### #3. Created two AWS security groups
* Public: allowed  SSH,HTTP, HTTPS, ICMP inbound traffic over interet
* Private: allowed  SSH,HTTP, HTTPS, ICMP inbound traffic over private network

### #4. Created two AWS instances
#### Ubuntu on public subnet

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
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("webserver-key.pem")
        host        = self.public_ip
        }

    }

    tags = {
        Name = "Ubuntu-server"
    }
    }

#### CentOS on private subnet

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
### 5. Security of instances
* Ubuntu allowed SSH,HTTP, HTTPS, ICMP inbound traffic from internet
* CentOS allowed SSH,HTTP, HTTPS, ICMP inbound traffic from private network

### 6. On Ubuntu server installed apache and docker
    #!/bin/bash
    sudo apt update
    sudo apt install apache2 -y
    sudo apt install php -y
    sudo rm /var/www/html/index.html

    #Docker installation
    sudo apt-get -y update
    sudo apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get -y update
    sudo apt-get -y install docker-ce docker-ce-cli containerd.io

### 7. On Ubuntu server created a web page with the text “Hello World” and information about the current version of the operating system.

![hello-world](img/hello-world.png)


## EXTRA 
### 1. AMI of both intances is dynamic
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
### #2. Made SSH connection from Ubuntu to CentOS
    ssh -i centos-key.pem centos@10.0.1.168

### #3. On CentOS server installed Ngnix and created a web page with the text “Hello World” and information about the current version of the operating system.

##### We can access to this page only from Ubuntu server

![hello-world-centos](img/centos-web-page.png)