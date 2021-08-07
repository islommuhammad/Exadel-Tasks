# Task 2: AWS Cloud


## Task 2 Result:
### [Web page](http://35.158.116.252/)

## Task steeps:
#### #1. Created two EC2 Instance t2.micro
![Instances](/Task2/img/instances.png)

#### #2. Installed Ubuntu and AWS Linux 2 operating systems. 

#### #3. I checked up SSH connection from my host to created EC2. 
* Ubuntu host's public ip is: 35.158.116.252
* AWS Linux2's public ip is: 3.125.119.88

#### #4. I added new Inbound rule for ping command in both instances.
![Inbound rule](/Task2/img/ping-rule.png)
#### #5. Generated new SSH key pairs in both instances and shered their public keys each other.
##### Checked up ping command in both server.
![AWS Linux ping](/Task2/img/AWS-Linux-ping.png)

![Ubuntu rule](/Task2/img/Ubuntu-ping.png)

#### #6. Installed Apache web server to Ubuntu;
![Apache web server](/Task2/img/apache.png)

#### #7. - Created web page with text “Hello World” and information about OS version;
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Exadel Internship</title>
    </head>
    <body onload="script();">
        <h1>HELLO WORLD!</h1>
    <p><?php echo("This server is running on: ".PHP_OS);?></p>
    <p><?php echo php_uname();?></p>
    <strong>Your system is: </strong><p id="OS"></p>
    <script>
        HTMLDocument.prototype.e = document.getElementById;
        var os = document.e("OS");
        var Name =  navigator.appVersion;
        window.addEventListener("load", function(){
        os.innerHTML = Name;
        });
    </script>
    </body>
    </html>
 

#### #8. I added one more new Inbound rule for access to http port 80 in Ubuntu instance and checked it in my browser;

![Web rule](/Task2/img/web-rule.png)

![Web page](/Task2/img/web-page.png)

#####  I checked up the web page in AWS Linux instance which not installed web server.
![Web page](/Task2/img/lynx.png)


## EXTRA: 
### I will do Extra Task soon...