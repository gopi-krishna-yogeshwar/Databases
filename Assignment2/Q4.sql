/*
mysql  Ver 8.0.30 for macos12.6 on arm64 (Homebrew)

I installed mysql in my local machine and ran the below queries in my mysql server. I used brew install mysql command to install the required database.
*/

create table EMPLOYEES(
EmployeeId int,
FirstName varchar(30),
LastName varchar(30),
EmailId varchar(30),
HourlyRate FLOAT(6,2)
);


insert into Employees values(1001,'Howard','Wolowitz', 'howard@usc,edu', 50.00);
insert into Employees values(1002,'Sheldon Lee', 'Cooper', 'scooper@usc.edu', 50.00 );
insert into Employees values(1003,'Leonard', 'Hofstader', 'leonard@usc.edu', 50.00);
insert into Employees values(1004,'Rajesh','Koothrapalli', 'rajkooth@usc.edu', 50.00);

create table EMPLOYEE_CLASS(EmployeeId int, ClassName varchar(128));

insert into EMPLOYEE_CLASS values(1002,'Synthesis algorithms');
insert into EMPLOYEE_CLASS values(1002,'Sound mixing');
insert into EMPLOYEE_CLASS values(1001,'EDM synthesis');
insert into EMPLOYEE_CLASS values(1004,'Electronic Music Fundamentals');
insert into EMPLOYEE_CLASS values(1003,'MIDI controllers');



select MAX(t4.hourlyrate * t5.total_students * 0.1) as max_bonus from (select employeeId, SUM(students_count) as total_students from (select employeeId, students_count from (select ClassName,COUNT(StudentId) as students_count from ENROLLMENT group by ClassName) as t1, employee_class as t2 where t1.classname = t2.classname) as t3 group by t3.employeeId) as t5, employees as t4 where t4.employeeid = t5.employeeid;



/*

I reused ENROLLMENT table from Q2 to get which students enrolled in which classes

I created an employee table with few employee details like name, email and hourly pay rate.

I created a bridge table which contains details of which prof. teaches which classes.

I initially created a sub query to get count of no. of students from from each class from enrollment table. Then I used this result to get no. of students
in each class taught by the each professor. I then grouped by prof name and took a sum of all students for each prof. in all classes that he teaches.
From the result of above subquery I multiplied it with the hourly rate of prof. from Employee table and 0.1 to get bonus. I took the max of calculated 
bonus values to return as result

as an example from above tables data - all prof.'s have same pay range

after initial sub query we have

+-------------------------------+------------------+
| ClassName                     | COUNT(StudentId) |
+-------------------------------+------------------+
| EDM synthesis                 |                4 |
| Electronic Music Fundamentals |                4 |
| MIDI controllers              |                3 |
| Synthesis algorithms          |                1 |
| Sound mixing                  |                1 |
+-------------------------------+------------------+

as result


then from another sub query we have

+------------+-------+
| employeeId | count |
+------------+-------+
|       1002 |     1 |
|       1002 |     1 |
|       1001 |     4 |
|       1004 |     4 |
|       1003 |     3 |
+------------+-------+


then after grouby and sum query 

+------------+----------------+
| employeeId | total_students |
+------------+----------------+
|       1002 |              2 |
|       1001 |              4 |
|       1004 |              4 |
|       1003 |              3 |
+------------+----------------+


when multiplied by hourly rate of 50.00 and 0.1 to 2,4,4,3 the values are 10,20,20,15 and max of it is 20 which is returned

+-----------+
| max_bonus |
+-----------+
|     20.20 |
+-----------+




*/