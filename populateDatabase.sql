USE UNIVERSITY;

INSERT INTO STUDENT (cwid, student_name, student_addr, student_phone)
VALUES  (1,'Billy Bob','123 rual rd','1234'),
		(2,'John Smith','456 west st','3214'),
		(3,'Bran Stark','345 north ave','9321'),
		(4,'Eddard Stark','235 headless ave','9432'),
		(5,'Jamie Lannister','543 highcastle st','1567'),
		(6,'Cersi Lannister','543 highcastle st','1786'),
		(7,'Petyr Baelish','667 mountain ave','2890'),
		(8,'Jon Snow','345 north ave','9034'),
		(9,'Theon Greyjoy','667 island way','4065'),
		(10,'Gregor Clegane','966 lowcastle bvd','1000'); 

INSERT INTO PROFESSOR (prof_ssn, prof_name, sex, salary, title, area_code, phone,st_addr, city, state, zip)
VALUES (0249, "Tony Stark", 'M', 50000, "Professor", "611", "1234567", "274 lemon Ave.", "Delaware", 'DL', "3425"),
		(4712, "Berry Jane", 'F', 68000, "Professor", "711", "7365992", "357 Main street", "Covina", 'CA', "8748"),
		(3241, "Steve Rogers", 'M', 90000, "Professor", "673", "9374723", "873 West Amsterdam", "Austin", "TX", "9314");

INSERT INTO DEPARTMENT (dept_no, dept_ssn, dept_name, dept_phone, dept_loc)
VALUES (1, 0249, 'Math', '654456', 'Math Bld'),
	   (2, 4712, 'Comp Science', '321456', 'Comp Sci Bld');

INSERT INTO  COURSE (course_no, course_dept_no, course_title, textbook, units)
VALUES (102, 1,  "Algebra I", "Elementary Algebra", "4"),
		(103, 1, "Trigonometry", "Intro to Dimension", "4"),
		(201, 2, "Data Structure", "Data Structure & Algorathms", "3"),
		(202, 2, "C++ Programming", "Beginning Programming","3"); 

INSERT INTO MAJOR (student_major_id, dept_major_id)
VALUES (1, 1),
	   (2, 2),
	   (3, 1),
	   (4, 2),
	   (5, 1),
	   (6, 2),
	   (7, 1),
	   (8, 2),
	   (9, 1),
	   (10, 2);