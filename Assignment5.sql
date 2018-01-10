--Assignment5
--Max Herrington


--1
PRINT'***QUESTION 1***'
PRINT''

CREATE DATABASE CollegeDB

--2
PRINT'***QUESTION 2***'
PRINT''

CREATE TABLE Student
(
ID INT IDENTITY(100000,1) PRIMARY KEY,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(30) NOT NULL
)

--3
PRINT'***QUESTION 3***'
PRINT''

CREATE TABLE Address
(
ID INT IDENTITY(1,1) PRIMARY KEY,
StudentID_FK INT FOREIGN KEY REFERENCES Student(ID)
ON DELETE CASCADE,
Street VARCHAR(50) NOT NULL,
City VARCHAR(30) NOT NULL,
PostalCode CHAR(7),
PhoneNumber VARCHAR(15),
Email VARCHAR(50) 
)


--4
PRINT'***QUESTION 4***'
PRINT''

CREATE TABLE Course
(
ID INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(60) NOT NULL,
CourseCode CHAR(8) NOT NULL,
Description VARCHAR(1000) NOT NULL
)


--5
PRINT'***QUESTION 5***'
PRINT''

CREATE TABLE Semester
(
ID NVARCHAR(3) CONSTRAINT ID_PK PRIMARY KEY,
Description VARCHAR(20) NOT NULL
)


--6
PRINT'***QUESTION 6***'
PRINT''

CREATE TABLE StudentCourse
(
StudentID INT CONSTRAINT StudentID_FK FOREIGN KEY REFERENCES Student(ID),
CourseID INT CONSTRAINT CourseID_FK FOREIGN KEY REFERENCES Course(ID),
SemesterID NVARCHAR(3) CONSTRAINT SemesterID_FK FOREIGN KEY REFERENCES Semester(ID),
Mark FLOAT CONSTRAINT Mark_DF DEFAULT 0,
CONSTRAINT StudentCourseID_PK PRIMARY KEY (StudentID,CourseID,SemesterID)
)


--7
PRINT'***QUESTION 7***'
PRINT''

INSERT INTO Student (FirstName,LastName)
VALUES ('Carey', 'Mahoney'),('Moses','Hightower'),('Debbie','Callahan')


--8
PRINT'***QUESTION 8***'
PRINT''

INSERT INTO Address (StudentID_FK,Street,City,PostalCode)
VALUES (100000,'298 Autumn Place','Waterloo','N2K 3C9'),
	(100000,'331 Royal York Road','Toronto','M8Y 2P8'),
	(100001,'11 Rose Street','Kitchener','N2H 1L5'),
	(100001,'70 Roehampton Unit 1711','Toronto','M4P 2C9'),
	(100002,'442 Dumfries Avenue','Kitchener','N2H 2G1'),
	(100002,'134 Rutledge Street','Bedford','B4A1X6')


--9
PRINT'***QUESTION 9***'
PRINT''

INSERT INTO Course
VALUES ('System Development: Concepts and Analysis','INFO8000','In this course you learn about UML diagrams.'),

	('Programming: Web Foundations','PROG1245','In this course you learn about HTML, CSS and Javascript.'),

	('Programming: Software Development Techniques','PROG8010','In this course you learn all about C#'),

	('Programming: Database Management','PROG8080','In this course you learn all about databases')


--10
PRINT'***QUESTION 10***'
PRINT''

INSERT INTO Semester
VALUES ('F15','Fall 2015'),('W16','Winter 2016'),('S16','Summer 2016')


--11
PRINT'***QUESTION 11***'
PRINT''

INSERT INTO StudentCourse (StudentID,CourseID,SemesterID)
VALUES (100000,1,'F15'),(100000,2,'F15'),
	(100001,3,'F15'),(100001,4,'F15'),
	(100002,1,'F15'),(100002,4,'F15')


--12
PRINT'***QUESTION 12***'
PRINT''

UPDATE StudentCourse
SET Mark = (CASE WHEN CourseID = 3 THEN 85
	WHEN CourseID = 4 THEN 90 END)
WHERE StudentID = 100001


--13
PRINT'***QUESTION 13***'
PRINT''

DELETE FROM StudentCourse
WHERE StudentID = 100002

DELETE FROM Student
WHERE ID = 100002



