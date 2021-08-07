# Task 2: AWS Cloud


## Task2 Results:

#### #1. Created two EC2 Instance t2.micro
![Instances](/Task2/img/instances.png)

#### #2. Installed Ubuntu and AWS Linux 2 operating systems. 

#### #3. I checked up SSH connection from my host to created EC2. 
Ubuntu host's public ip is: 35.158.116.252
AWS Linux2's public ip is: 3.125.119.88

#### #4. I added new Inbound rule for ping command in both instances.
![Inbound rule](/Task2/img/ping-rule.png)
#### #5. Generated new SSH key pairs in both instances and shered their public keys each other.
Checked up ping command in both server.
![Inbound rule](/Task2/img/AWS-Linux-ping.png)
![Inbound rule](/Task2/img/Ubuntu-ping.png)
 Make sure is an ping and SSH passed from one instance to another and vice versa. Configure SSH connectivity between instances using SSH keys.
#### #6. Install web server (nginx/apache) to one instance;
##### - Create web page with text “Hello World” and information about OS version;
##### - Make sure web server accessible from internet and you can see your web page “Hello World” in your browser;

##### - Make sure in instance without nginx/apache you can see “Hello world” from instance with nginx/apache.


EXTRA: 

#1. Run steps 3-6 with instances created in different VPC. (connectivity must be both external and internal IP)        
#2. Write BASH script for installing web server (nginx/apache) and creating web pages with text “Hello World”, and information about OS version
#3. Run step.6 without “manual” EC2 SSH connection.
