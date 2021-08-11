#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo apt install php -y
sudo rm /var/www/html/index.html

echo "<!DOCTYPE html>
<html lang=\"en\">
\t<head>
 \t\t   <meta charset=\"UTF-8\">
\t\t    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
\t\t    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
\t\t    <title>Exadel Internship</title>
\t</head>\n
\t<body onload=\"script();\">
\t\t    <h1>HELLO WORLD!</h1>
\t\t<p><?php echo(\"This server is running on: \".PHP_OS);?></p>
\t\t<p><?php echo php_uname();?></p>
\t\t<strong>Your system is: </strong><p id=\"OS\"></p>
\t\t<script>
\t\t\t    HTMLDocument.prototype.e = document.getElementById;
 \t\t\t   var os = document.e(\"OS\");
 \t\t\t   var Name =  navigator.appVersion;
 \t\t\t   window.addEventListener(\"load\", function(){
 \t\t\t   os.innerHTML = Name;
\t\t\t    });
\t\t</script>
\t</body>
</html>
" > /var/www/html/index.php