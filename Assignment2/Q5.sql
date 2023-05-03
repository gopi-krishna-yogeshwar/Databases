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


select name from (select t1.name, count(t1.subject) as total_required_subjects from (select name,prof_subjects.subject from prof_subjects, required_subjects where prof_subjects.subject = required_subjects.subject) as t1 group by t1.name) as t2, (select count(*) as count from required_subjects) as t3 where t2.total_required_subjects = t3.count;

/*

I created a table for required subjects which contains the list of all subjects that a prof has to teach.

I am initially taking a cross product of prof_subjects and required_subjects tables to get a list of all professors who teach the required subjects.

Next to ensure that the professor is teaching all the required subjects from the result of above subquery I am grouping by prof. name and taking a count
of no. of subjects he teaches and collecting the result which contains a prof. name and no. of required subjects he teaches.

Then I am taking a count of no. of required subjects from required_subjects table and checking if it equal to counts result from above sub query and
selecting the rows which satisfy the equality condition.

*/

