
<!-- 
Developed by Edgard Luigi Sanchez, Raul Garcia, Jay Johnson

Config.php will be called by the index.php first to create a connection with the server.
 -->


<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

	<?php 

	/*
		Encapsulate sensitive data away from the public data.
	*/
	$server = "ecs.fullerton.edu";
	$username = "cs332g42";
	$password = "YOUR PASSWORD";

	//create connection
	$connect =  @mysqli_connect($server, $username, $password, 'cs332g42');

	//check connection
	if(!$connect)
	die("connection failed:" . mysqli_connect_error());

	echo "Connected successfully <br>";

		

	?>

</body>
</html>


