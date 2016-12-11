
USE UNIVERSITY;

INSERT INTO PROFESSOR (prof_ssn, prof_name, sex, salary, title, area_code, phone,st_addr, city, state, zip)
VALUES (0249, "Tony Stark", 'M', 50000, "Professor", "611", "1234567", "274 lemon Ave.", "Delaware", 'DL', "3425"),
		(4712, "Berry Jane", 'F', 68000, "Professor", "711", "7365992", "357 Main street", "Covina", 'CA', "8748"),
		(3241, "Steve Rogers", 'M', 90000, "Professor", "673", "9374723", "873 West Amsterdam", "Austin", "TX", "9314");

INSERT INTO  COURSE (course_no, course_dept_no, course_title, textbook, units)
VALUES (102, 1,  "Algebra I", "Elementary Algebra", "4"),
		(103, 1, "Trigonometry", "Intro to Dimension", "4"),
		(201, 2, "Data Structure", "Data Structure & Algorathms", "3"),
		(202, "C++ Programming", "Beginning Programming","3"); 		