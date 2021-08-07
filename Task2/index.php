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
