/*
mysql  Ver 8.0.30 for macos12.6 on arm64 (Homebrew)

I installed mysql in my local machine and ran the below queries in my mysql server. I used brew install mysql command to install the required database.
*/


create table PROF_SUBJECTS(
name varchar(30),
subject varchar(30)
);

insert into PROF_SUBJECTS values('Aleph','MIDI controllers');
insert into PROF_SUBJECTS values('Aleph','Sound mixing');
insert into PROF_SUBJECTS values('Aleph','Synthesis algorithms');
insert into PROF_SUBJECTS values('Bit','EDM synthesis');
insert into PROF_SUBJECTS values('Bit','Electronic Music Fundamentals');
insert into PROF_SUBJECTS values('Bit','Sound mixing');
insert into PROF_SUBJECTS values('CRC','EDM synthesis');
insert into PROF_SUBJECTS values('CRC','Electronic Music Fundamentals');
insert into PROF_SUBJECTS values('Dat','MIDI controllers');
insert into PROF_SUBJECTS values('Dat','EDM synthesis');
insert into PROF_SUBJECTS values('Dat','Electronic Music Fundamentals');
insert into PROF_SUBJECTS values('Emscr','MIDI controllers');
insert into PROF_SUBJECTS values('Emscr','Synthesis algorithms');
insert into PROF_SUBJECTS values('Emscr','Electronic Music Fundamentals');
insert into PROF_SUBJECTS values('Emscr','EDM synthesis');

create table required_subjects(subject varchar(30));

insert into required_subjects values('Electronic Music Fundamentals');
insert into required_subjects values('MIDI controllers');
insert into required_subjects values('EDM synthesis');


select distinct name from prof_subjects where name not in (select distinct t3.name from (select t1.name,t2.subject from (select distinct name from prof_subjects) as t1, (select distinct subject from required_subjects) as t2) as t3 where  (t3.name,t3.subject) not in (select * from prof_subjects));

/*

I created a cartesian product of all distinct prof. names and subjects they are required to teach.

Then I am performing a set substraction operation of above results with actual table (results - actual table). 

This will give us the names of prof. who are not teaching all the required subjects.

From the initial list of all distinct prof. names I am subtracting the names of prof. who do not teach all the courses giving the required result.

I am using not in operator in my sql to perform the set substraction operation.


*/

