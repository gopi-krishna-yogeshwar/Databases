/*
mysql  Ver 8.0.30 for macos12.6 on arm64 (Homebrew)

I installed mysql in my local machine and ran the below queries in my mysql server. I used brew install mysql command to install the required database.
*/


create table project_status(
pid varchar(30),
step int, 
status char(1)
);


insert into project_status values('P100',0,'C');
insert into project_status values('P100',1,'W');
insert into project_status values('P100',2,'W');
insert into project_status values('P201',0,'C');
insert into project_status values('P201',1,'C');
insert into project_status values('P333',0,'W');
insert into project_status values('P333',1,'W');
insert into project_status values('P333',2,'W');
insert into project_status values('P333',3,'W');
insert into project_status values('P444',0,'C');
insert into project_status values('P444',1,'W');
insert into project_status values('P444',2,'W');
insert into project_status values('P555',0,'C');
insert into project_status values('P555',1,'W');
insert into project_status values('P555',2,'W');
insert into project_status values('P666',0,'W');
insert into project_status values('P777',0,'C');
insert into project_status values('P777',1,'C');
insert into project_status values('P777',2,'C');
insert into project_status values('P777',3,'W');

select t1.pid from project_status as t1, project_status as t2 where (t1.pid = t2.pid and t1.step = 0 and t2.step = 1 and t1.status = 'C' and t2.status = 'W');



/*

I took a cartetian product of the table with itself and used a where query to check in the resulted table where step 0 has status C and step 1
has status W. Since it is guarenteed that C,W,C,W sequence will not occur (from HW description) and all C's will always occur before W I used this
approach. I added few extra rows to the given data to verify my result

*/