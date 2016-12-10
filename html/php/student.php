<!DOCTYPE html>
<html>
<head>
	<title>
		Student Interface
	</title>
</head>
<body>
	<h1>Welcome Students!</h1>	
	<?php
	/*
	Given the course number, list course information
	Given the student cwid, list the student history and grades
	*/



	?>

	<form action = "student.php" method = "POST">
		
		Course: <br>
		<input type = "text" 	name = "student-input-course"> 
		<input type = "submit" 	name = "course_button" value = "Available courses">
		<br>
		<br>
			OR
		<br>
		<br>
		Cwid #: 
		<input type = "text" 	name = "student-input-cwid"> 	
		<input type = "submit" 	name = "cwid_button" value = "List course history"><br>

	</form>
</body>
</html>