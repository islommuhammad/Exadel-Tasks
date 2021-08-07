# Task 2: AWS Cloud


## Task2 Results:

#### * Created 2 EC2 Instances on a VPC
![Instances](/Task2/img/instances.png)
#### #2. Explore AWS Billing for checking current costs.
#### #3. Create two EC2 Instance t2.micro with different operating systems (Amazon linux / Ubuntu ...). Try to stop them, restart, delete, recreate.
#### #4. Make sure there is an SSH connection from your host to the created EC2. What IP EC2 used for it?
#### #5. Make sure is an ping and SSH passed from one instance to another and vice versa. Configure SSH connectivity between instances using SSH keys.
#### #6. Install web server (nginx/apache) to one instance;
##### - Create web page with text “Hello World” and information about OS version;
##### - Make sure web server accessible from internet and you can see your web page “Hello World” in your browser;

##### - Make sure in instance without nginx/apache you can see “Hello world” from instance with nginx/apache.


EXTRA: 

#1. Run steps 3-6 with instances created in different VPC. (connectivity must be both external and internal IP)        
#2. Write BASH script for installing web server (nginx/apache) and creating web pages with text “Hello World”, and information about OS version
#3. Run step.6 without “manual” EC2 SSH connection.
