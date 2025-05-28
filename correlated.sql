-- salary employee 10001 avg salary greater
select avg(salary) from salaries where emp_no=10001;
select * from salaries
where salary>(select avg(salary) from salaries where emp_no=10001);



-- multi row/multi query/correlated

select * from salaries as s1
where salary>(select avg(salary) from salaries as s2 where s1.emp_no=s2.emp_no);


create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);



select * from employees;

-- Q1.salary greater than the employees dept avergae

select * from employees as e1
where salary>(select avg(salary) from employees as e2 where e2.DeptID=e1.DeptID);


-- Q2. list department where at least one employee earns more than 60000

select deptid,deptname from departments  as d
where  exists(select deptid from employees e where d.deptid=e.deptid and e.salary>60000 );

-- Q3. find employyes who have heighest salary in their dpartment
select * from departments;
select * from employees; 

select * from employees as e1
where salary=(select max(salary) from employees as e2 where e2.deptid=e1.deptid);






CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);

select * from Students;
select *  from Courses;
select * from enrollments;

-- get the student name, stu id, course name for each student

select studentid,studentname,coursename 
from students as s
join courses as c
on  c.department=s.department;

-- find student who scored above the average in any course they enrolled in

select * from enrollments as s
where grade>(select avg(grade) from enrollments as e where e.studentid=s.studentid);

-- list all students who have heighest grade in atleast one course
select * from enrollments as s
where grade=(select max(grade) from enrollments as e where e.courseid=s.courseid);
