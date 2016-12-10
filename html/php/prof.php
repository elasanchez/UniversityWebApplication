<!DOCTYPE html>
<html>
<head>
	<title>
		Professor Interface
	</title>
</head>
<body>
	<h1> 
		Welcome Faculty Member!
	</h1>
	<?php
	/*
	Given the ssn of a prof, list the titles, classrooms, meeting days and time of classes.
	*/



	?>

	<form action = "prof.php" method = "POST">
		
		Ssn: <br>
		<input type = "text" 	name = "prof-input-ssn"> 
		<input type = "submit" 	name = "ssn_button" value = "Professor Schedules">
		<br>
		<br>
			OR
		<br>
		<br>
		Course #: 
		<input type = "text" 	name = "prof-input-course"> 
		and Section #:
		<input type = "text"    name = "prof-input-section">	
		<input type = "submit" 	name = "ssn_button" value = "Student Grades"><br>

	</form>
</body>
</html>