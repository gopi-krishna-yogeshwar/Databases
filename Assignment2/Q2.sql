/*
mysql  Ver 8.0.30 for macos12.6 on arm64 (Homebrew)

I installed mysql in my local machine and ran the below queries in my mysql server. I used brew install mysql command to install the required database.
*/

create table ENROLLMENT(
StudentId int,
ClassName varchar(128),
Grade char(1)
)

insert into Enrollment values(123,'Synthesis algorithms','A');
insert into Enrollment values(123,'EDM synthesis','B');
insert into Enrollment values(123,'MIDI controllers','B');
insert into Enrollment values(662,'Sound mixing','B');
insert into Enrollment values(662,'EDM synthesis','A');
insert into Enrollment values(662,'Electronic Music Fundamentals','A');
insert into Enrollment values(662,'MIDI controllers','B');
insert into Enrollment values(345,'MIDI controllers','A');
insert into Enrollment values(345,'Electronic Music Fundamentals','B');
insert into Enrollment values(345,'EDM synthesis','A');
insert into Enrollment values(555,'EDM synthesis','B');
insert into Enrollment values(555,'Electronic Music Fundamentals','B');
insert into Enrollment values(213,'Electronic Music Fundamentals','A');

select ClassName,COUNT(StudentId) from ENROLLMENT group by ClassName order by COUNT(StudentId) desc;

/*

To get the result I grouped by calss name, took count of student id and ordered by student id

*/