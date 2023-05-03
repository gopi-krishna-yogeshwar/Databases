/*
mysql  Ver 8.0.30 for macos12.6 on arm64 (Homebrew)

I installed mysql in my local machine and ran the below queries in my mysql server. I used brew install mysql command to install the required database.
*/

CREATE TABLE ProjectRoomBookings
values(roomNum INTEGER NOT NULL,
startTime INTEGER NOT NULL,
endTime INTEGER NOT NULL,
groupName CHAR(10) NOT NULL,
PRIMARY KEY (roomNum, startTime));

/*
part-1
*/

/*

We can modify the create statement to add a CHECK constraint at the end time to verify if end time > start time, check if start time >=0 and <=23
endTime >0 and <= 24(can't end at 0)
Below in the modified create statement

*/

CREATE TABLE ProjectRoomBookings(roomNum int NOT NULL,
startTime int NOT NULL CHECK(startTime >= 0 and startTime <24),
endTime int NOT NULL, CHECK (endTime > startTime and endTime >= 0 and endTime <24),
groupName CHAR(10) NOT NULL,
PRIMARY KEY (roomNum, startTime));


/*
part-2
*/


/*

We can write a function to check this condition:
1. for a given room which we want to insert, we will check all the entries in table for that room
2. for all those rooms with existing schedule we will check if following condition satisfies for any of the rows

condition - (start1, end1) are the timings of exisiting schedule in table
			(start2, end2) are the timings we want to book a room

			 if start1 <= end2 and start2 <= end1:
			 	then there is a overlap of interval and we will not allow to book a room
			 else:
			 	there is no overlap and we can book the room for the given interval


if the condition is satisfied for any of the rows then there is an overlap and we will not allow to book a room. else we will allow to book a room.
We can write triggers to ensure this condition

*/