
<html>
	<head>
		<title>
			 UDWA 
		</title>

			<h2>UNIVERSITY DATABASE WEB APPLICATION</h2> 
	</head>

	<body>

		<?php 
		//in this class define the structure of the database,
		//in other words Data Definition Language of DB university


		//reset the variable every time the page refreshes
		$decision = ""; 

		/*Determine which button was selected*/
		if(isset($_POST["Professor"]))
		{
			$decision = $_POST['Professor'];
		}
		else if(isset($_POST["Student"]))
		{
			$decision = $_POST['Student'];
		}


		//Switch to another php
		if($decision == "Professor")
		{
			header('Location: /php/prof.php');
		}
		else if($decision == "Student")
		{
			header('Location: /php/student.php');
		}
		// else  GOING BACK DOESNT WORKK FOR ME

?>
		<!--create buttons as a menu for the user.-->
		<form action="index.php" method="post">
		  <input type="submit" name = "Professor" value="Professor">
		  <input type="submit" name = "Student" value="Student">
		</form>
	</body>

	<?php	$connect->close(); ?>	
</html>






