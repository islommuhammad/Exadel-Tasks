# Installing ngnix
sudo yum -y install epel-release
sudo yum –y install nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# firewall-cmd --zone=public --permanent --add-service=http
# firewall-cmd --zone=public --permanent --add-service=https
# firewall-cmd --reload
