DROP DATABASE IF EXISTS university;
DROP DATABASE IF EXISTS UNIVERSITY;

CREATE DATABASE UNIVERSITY;

USE UNIVERSITY;

CREATE TABLE STUDENT
(
	cwid INT NOT NULL PRIMARY KEY,
	student_name VARCHAR(25) NOT NULL,
	student_addr VARCHAR(20),
	student_phone VARCHAR(15)
);

CREATE TABLE PROFESSOR
(
	prof_ssn INT NOT NULL PRIMARY KEY,
	prof_name VARCHAR(15),
	sex CHAR(1), 
	salary FLOAT(2), 
	title VARCHAR(15), 
	area_code VARCHAR(5), 
	phone VARCHAR(10),
	st_addr VARCHAR(20),
	city VARCHAR(20), 
	state CHAR(2), 
	zip VARCHAR(5)
);

CREATE TABLE DEGREE
(
	degree_title VARCHAR (25) NOT NULL,
	degree_ssn INT NOT NULL,
	PRIMARY KEY(degree_title, degree_ssn),
	FOREIGN KEY (degree_ssn) REFERENCES PROFESSOR(prof_ssn)
);

CREATE TABLE DEPARTMENT
(
	dept_no INT  NOT NULL PRIMARY KEY, 
	dept_ssn INT NOT NULL,
	dept_name VARCHAR(20) NOT NULL, 
	dept_phone VARCHAR(10),
	dept_loc VARCHAR(20),
	FOREIGN KEY(dept_ssn)
	REFERENCES PROFESSOR(prof_ssn)
);

CREATE TABLE COURSE
(
	course_no INT NOT NULL PRIMARY KEY,
	course_dept_no INT NOT NULL,
	course_title VARCHAR(15),
	textbook VARCHAR(40),
	units INT,
	FOREIGN KEY(course_dept_no) REFERENCES DEPARTMENT(dept_no)
);	


CREATE TABLE SECTION
(
	section_no INT NOT NULL PRIMARY KEY, 
	prof_ssno INT NOT NULL,
	course_number INT NOT NULL,
	classroom VARCHAR(10), 
	beg_time VARCHAR(10), 
	end_time VARCHAR(10), 
	seat_count INT, 
	meeting_days VARCHAR(10),
	FOREIGN KEY (prof_ssno) REFERENCES PROFESSOR(prof_ssn),
	FOREIGN KEY (course_number) REFERENCES COURSE(course_no)
);

CREATE TABLE MAJOR
(
	student_major_id INT NOT NULL,
	dept_major_id INT NOT NULL,
	PRIMARY KEY(student_major_id,dept_major_id),
	FOREIGN KEY (student_major_id) REFERENCES STUDENT(cwid),
	FOREIGN KEY (dept_major_id) REFERENCES DEPARTMENT(dept_no)

);

CREATE TABLE MINOR
(
	student_minor_id INT NOT NULL,
	dept_minor_id INT NOT NULL,
	PRIMARY KEY(student_minor_id,dept_minor_id),
	FOREIGN KEY(student_minor_id) REFERENCES STUDENT(cwid),
	FOREIGN KEY(dept_minor_id) REFERENCES DEPARTMENT(dept_no)

);

CREATE TABLE PREREQUISITE
(
	crs_no INT NOT NULL,
	prereq_title VARCHAR(15),
	PRIMARY KEY(crs_no,prereq_title),
	FOREIGN KEY(crs_no) REFERENCES COURSE (course_no)
);

CREATE TABLE ENROLL
(
	grade CHAR(2),
	id INT NOT NULL,
	crs_num INT NOT NULL,
	sec_num INT NOT NULL,
	PRIMARY KEY(crs_num, sec_num, id),
	FOREIGN KEY(crs_num) REFERENCES COURSE(course_no),
	FOREIGN KEY(sec_num) REFERENCES SECTION(section_no),
	FOREIGN KEY(id) REFERENCES STUDENT(cwid)
);












