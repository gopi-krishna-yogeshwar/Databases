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


select distinct t4.name from (select t3.name, count(t3.name) as count from (select * from prof_subjects where (name, subject) in (select t1.name,t2.subject from (select distinct name from prof_subjects) as t1, (select distinct subject from required_subjects) as t2)) as t3 group by t3.name) as t4 where t4.count = (select count(*) from required_subjects);

/*

I created a cross product of all distinct prof. names and subjects they are required to teach.
Then I took a intersection of the above results and the existing table.
Then I used group by to get counts of each prof. and no. of required subjects they teach.
I am comparing this count to the actual no. of required subjects and outputting results which match count.
Since I am taking intersection of results it will not take into consideration if prof. reaches other subjects

*/

