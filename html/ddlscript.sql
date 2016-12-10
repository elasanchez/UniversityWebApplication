DROP DATABASE IF EXISTS university;
DROP DATABASE IF EXISTS UNIVERSITY;

CREATE DATABASE UNIVERSITY;

USE UNIVERSITY;

CREATE TABLE STUDENT
(
	cwid INT NOT NULL PRIMARY KEY,
	student_name VARCHAR(15) NOT NULL,
	student_addr VARCHAR(20),
	student_phone VARCHAR(10)
);

CREATE TABLE PROFESSOR
(
	prof_ssn INT NOT NULL PRIMARY KEY,
	prof_name VARCHAR(15),
	sex CHAR(1), 
	salary FLOAT(2), 
	title VARCHAR(15), 
	area_code VARCHAR(3), 
	phone VARCHAR(7),
	st_addr VARCHAR(15),
	city VARCHAR(10), 
	state CHAR(2), 
	zip VARCHAR(5)
);

CREATE TABLE DEPARTMENT
(
	dept_no INT  NOT NULL PRIMARY KEY, 
	dept_ssn INT NOT NULL,
	dept_name VARCHAR(15) NOT NULL, 
	dept_phone VARCHAR(10),
	dept_addr VARCHAR(20), 
	dept_location VARCHAR(15),
	FOREIGN KEY(dept_ssn)
	REFERENCES PROFESSOR(prof_ssn)
)ENGINE=INNODB	;

CREATE TABLE COURSE
(
	course_no INT NOT NULL PRIMARY KEY,
	course_title VARCHAR(15),
	textbook VARCHAR(20),
	units INT
);

CREATE TABLE OFFERS
(
	dept_num INT NOT NULL,
	course_num INT NOT NULL,
	
	PRIMARY KEY (dept_num, course_num),
 	UNIQUE INDEX ( dept_num, course_num),
	FOREIGN KEY(dept_num) REFERENCES DEPARTMENT(dept_no),
	FOREIGN KEY(course_num)	REFERENCES COURSE(course_no)

)ENGINE=INNODB;

CREATE TABLE SECTION
(
	section_no INT NOT NULL PRIMARY KEY, 
	classroom VARCHAR(4), 
	beg_time DATE, 
	end_time DATE, 
	seat_count INT, 
	days VARCHAR(10)
);

CREATE TABLE MAJOR
(
	student_major_id INT NOT NULL,
	dept_major_id INT NOT NULL,
	PRIMARY KEY(student_major_id,dept_major_id),
	FOREIGN KEY (student_major_id) REFERENCES STUDENT(cwid),
	FOREIGN KEY (dept_major_id) REFERENCES DEPARTMENT(dept_no)

)ENGINE= INNODB;

CREATE TABLE MINOR
(
	student_minor_id INT NOT NULL,
	dept_minor_id INT NOT NULL,
	PRIMARY KEY(student_minor_id,dept_minor_id),
	FOREIGN KEY(student_minor_id) REFERENCES STUDENT(cwid),
	FOREIGN KEY(dept_minor_id) REFERENCES DEPARTMENT(dept_no)

) ENGINE = INNODB;

CREATE TABLE PREREQUISITE
(
	crs_no INT NOT NULL,
	prereq_title VARCHAR(15),
	PRIMARY KEY(crs_no,prereq_title),
	FOREIGN KEY(crs_no) REFERENCES COURSE (course_no)
) ENGINE = INNODB;

CREATE TABLE ENROLL
(
	grade CHAR(1),
	id INT NOT NULL,
	crs_num INT NOT NULL,
	sec_num INT NOT NULL,
	PRIMARY KEY(crs_num, sec_num, id),
	FOREIGN KEY(crs_num) REFERENCES COURSE(course_no),
	FOREIGN KEY(sec_num) REFERENCES SECTION(section_no),
	FOREIGN KEY(id) REFERENCES STUDENT(cwid)
)ENGINE=INNODB;












