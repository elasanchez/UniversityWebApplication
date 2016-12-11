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

		if(isset($_POST["ssn_button"]) && !empty($_POST['prof-input-ssn']))
		{
			require_once ('../config.php');
			
			$ssn = $_POST['prof-input-ssn'];
		
			$query = "SELECT course_title, classroom, meeting_days, beg_time, end_time
					FROM PROFESSOR, SECTION, COURSE
					WHERE $ssn = prof_ssn
						 AND prof_ssn = prof_ssno
						 AND course_no = course_number";

			$response = @mysqli_query($connect, $query);

			if($response)
			{
				echo '<table align = "left"
					cellspacing = "5" cellpadding="8">
					
				<tr>
				<td align="left"><b>Title</b>
				<td align="left"><b>Classroom</b>
				<td align="left"><b>Meeting Days</b>
				<td align="left"><b>Start Time</b>
				<td align="left"><b>End Time</b></tr>';

				while($row = mysqli_fetch_array($response))
				{
					echo '<tr> <td align = "left">' .
					
					$row[course_title] . '</td><td align = "left">'.
					$row[classroom] . '</td><td align = "left">'.
					$row[meeting_days] . '</td><td align = "left">'.
					$row[beg_time] . '</td><td align = "left">'.
					$row[end_time] . '</td><td align = "left">'	;
					echo '</tr>';
					
				}

				echo "</table>";
			}
			else
			{
				echo "Couldn't issue database query.      <br>";
				echo mysqli_error($connect); //issue error
			}
			mysql_close($connect);
		}
		else
		{
			echo "Please enter your ssn to look at your schedule.      <br>";
			/**/
		}



		if(isset($_POST['cs_button']))
		{

			if(!empty($_POST['prof-input-course']))
			{
				if(!empty($_POST['prof-input-section']))
				{
				
					require_once ('../config.php');
					
					$course = $_POST['prof-input-course'];
					$section = $_POST['prof-input-section'];
				
					$query = "SELECT grade, COUNT(*) AS Total
								FROM ENROLL
								WHERE  $section = sec_num 
								AND $course = crs_num
								GROUP BY grade";

					$response = @mysqli_query($connect, $query);

					if($response)
					{
						echo '<table align = "left"
							cellspacing = "5" cellpadding="8">
							
						<tr>
						<td align="left"><b>Letter Grade</b>
						<td align="left"><b>Total</b></tr>';

						while($row = mysqli_fetch_array($response))
						{
							echo '<tr> <td align = "left">' .
							
							$row[grade] . '</td><td align = "left">'.
							$row[Total] . '</td><td align = "left">';
							echo '</tr>';
							
						}

						echo "</table>";
					}
					else
					{
						echo "Couldn't issue database query.<br>";
						echo mysqli_error($connect); //issue error
					}

					mysql_close($connect);
				}
				else
				{
					echo "Please enter the section number.<br>";
				}
			}
			else
			{
				echo "Please enter your course number.<br>";
			}
		}


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
		<input type = "submit" 	name = "cs_button" value = "Student Grades"><br>

	</form>
</body>
</html>