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
	
	// Given the course number, list course information
	
	/*Determine which button was selected*/
		if(isset($_POST["course_button"]) && !empty($_POST['student-input-course']))
		{//
			require_once ('../config.php');
			
			 $course = $_POST['student-input-course'];

			$query = "SELECT section_no, classroom, meeting_days, beg_time, end_time, count(*) AS count
						FROM SECTION, COURSE
					 	WHERE $course = course_no 
					 	AND course_no = course_number 
					 	GROUP BY section_no";

			$response = @mysqli_query($connect, $query);

				if($response)
				{
					echo '<table align = "left"
						cellspacing = "5" cellpadding="8">
						
					<tr><td align="left"><b></b>
					<td align="left"><b>Section Number</b>
					<td align="left"><b>Classroom</b>
					<td align="left"><b>Meeting Days</b>
					<td align="left"><b>Start Time</b>
					<td align="left"><b>End Time</b>
					<td align="left"><b>Students</b></tr>';

					while($row = mysqli_fetch_array($response))
					{
						echo '<tr> <td align = "left">' .'</td><td align = "left">' .
						$row[section_no] . '</td><td align = "left">' .
						$row[classroom] . '</td><td align = "left">' .
						$row[meeting_days] . '</td><td align = "left">'.
						$row[beg_time] . '</td><td align = "left">' .
						$row[end_time] . '</td><td align = "left">' .
						$row[count] . '</td><td align = "left">' ;
						echo '</tr>';
					}

					echo "</table>";
				
				}
				else
				{
					echo "Couldn't issue database query";
					echo mysqli_error($connect); //issue error
				}

				mysql_close($connect);
			}
		


		/**/
		if(isset($_POST["cwid_button"]) && !empty($_POST['student-input-cwid']))
		{//
			require_once ('../config.php');
			
			 $cwid = $_POST['student-input-cwid'];

			$query = "SELECT course_title, grade
						FROM COURSE, SECTION, ENROLL, STUDENT
						WHERE $cwid = cwid 
						AND cwid = id
						AND sec_num = section_no
						AND course_number = course_no";

			$response = @mysqli_query($connect, $query);

				if($response)
				{
					echo '<table align = "left"
						cellspacing = "5" cellpadding="8">
						
					<tr><td align="left"><b></b>
					<td align="left"><b>Course Title</b>
					<td align="left"><b>Letter Grade</b></tr>';

					while($row = mysqli_fetch_array($response))
					{
						echo '<tr> <td align = "left">' .'</td><td align = "left">' .
						$row[course_title] . '</td><td align = "left">' .
						$row[grade] . '</td><td align = "left">' ;
						echo '</tr>';
					}

					echo "</table>";
				
				}
				else
				{
					echo "Couldn't issue database query";
					echo mysqli_error($connect); //issue error
				}

				mysql_close($connect);
			}

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

<!-- 
select dept_no, prof_name from DEPARTMENT, PROFESSOR WHERE dept_name = 'Math' AND prof_ssn = 0249; -->