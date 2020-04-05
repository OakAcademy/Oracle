--##############################################################
-- Hi dear friends, This file is about Controlling User Access  
-- on oracle database

-- you need to run table initialization scripts to create tables 
-- then you can run examples without problem
--##############################################################


--------- start of table initialization scripts ------------------------------------

		DROP TABLE student cascade constraints purge;

		drop table employee cascade constraints purge ;


		create table student (studentId number, name varchar2(50), surname varchar2(50), score number, gender varchar2(10));

		insert into student (studentid , name , surname , score, gender ) values ( 1,'emily','brown',88,'female');
		insert into student (studentid , name , surname , score, gender ) values ( 2,'artur','blink',65,'male');
		insert into student (studentid , name , surname , score, gender ) values ( 3,'anastasia','bryanov',76,'female');
		insert into student (studentid , name , surname , score, gender ) values ( 4,'paul','jackson',89,'male');
		insert into student (studentid , name , surname , score, gender ) values ( 5,'khalil','khan',75,'male');
		insert into student (studentid , name , surname , score, gender ) values ( 6,'irvin','ingza',69,'female');
		insert into student (studentid , name , surname , score, gender ) values ( 7,'claudia','karmen',56,'female');
		insert into student (studentid , name , surname , score, gender ) values ( 8,'John','clark',55,'male');

		create table employee 
		(employeeid number, 
		 name varchar2(50),
		 surname varchar2(50), 
		 salary number, 
		 dateofbirth date,
		 department varchar2(150), 
		 email varchar2(100), 
		 phone varchar2(15), 
		 managerId number) ;

		alter table employee add ( constraint employee_pk primary key (employeeid));

		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 1,'james','smith',1000,'01 May 1983', 'HR','jmrsmith@zoracle.com', '(111) 998 88 21',4);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 2,'JAMES','GOLD',3500,'12 Mar 1971', 'Management','jgold12@zoracle.com', '99999 8819',null);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 3,'MARY','Slim',4500,'31 Aug 1982', 'Management','abc_def@zoracle.com', '(888) 283 88 11',2);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 4,'Ken','Rhytym',1500,'23 Apr 1970', 'HR','abcdef@zoracle.com', '(9991) 992 881',null);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 5,'Paula','SMITH',5500,'01 Jun 1991', 'Management','paulasmth@zoracle.com', '(9991) 91 88 88',2);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 6,'Larry','DEEN',null,'02 Jul 1992', 'HR','Larrydeeen@zoracle.com', '99199 999',4);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 7,'Chris','Been',null,'03 Feb 1982', 'IT','chrisb@zoracle.com', '(123) 0299209',8);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 8,'Levis','Brian',8700,'14 Sep 1982', 'IT','levbri@zoracle.com', '(999) 0100 12 2',null);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 9,'Cordi','Klun',4500,'17 Apr 1977', 'HR','cordikl@zoracle.com', '(889) 999 01 23',4);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 10,'Berr','Gerr',4600,'18 Oct 1979', 'HR','berrger@zoracle.com', '(888) 888 23 23',4);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 11,'Klint','Kris',4800,'20 Nov 1981', 'IT','klintkr@zoracle.com', '(778) 888 89 89',8);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 12,'Noah','Thura',8100,'21 Dec 1977', 'IT','noahtha@zoracle.com', '(788) 999 9900',8);

		commit;

--------- end of table initialization scripts ----------------------------------------------------------------

-----------------------------------------------------------------
-----------------------------------------------------------------
--------- EXAMPLES ----------------------------------------------


--under sql developer with adminconn ( sys dba) connection 

A. after connect, run these commands ordered on sql developer with adminconn to create test1 and test2 users, and general_role and give the role users  

	1. create user test1 identified by test1;

	2. create user test2 identified by test2;
	
	3. create role general_role;
	
	4. grant create session, create table, create view, create procedure to general_role;

	5. grant general_role to test1, test2;
	

B. [on sql developer with myhospital user] create a public synonym for employee table

	1. create or replace public synonym employee for employee;

C. [on sql developer with myhospital user]  grant all privileges on employee table with grant option to test1
	1. grant all on employee  to test1 with grant option;

D. [on sql developer with test1 user ]  retrieving data from other users table.

	1. select * from employee

E. [on sql developer with test1 user ] giving privilege on employee table to test2 under test1 user.

	1. grant select on employee to test2;

F. [on sql developer with test1 user ] giving privilege on employee table to test2 with grant option under test1 user.

	1. grant select on employee to test2 with grant option;

G. [on sql developer with myhospital user] create synonym for student table

	1. create or replace public synonym student for student;

H. [on sql developer with myhospital user] to inspect  student table 

	1. select * from student

I. [on sql developer with myhospital user] giving column based update privilege to test1 

	1. grant update(name,surname) on student to test1;

J. 	[on sql developer with test1 user ] update score of students ( you will get error , because score column grant not be given test1 user 

	1. update student set score = score + 10;

K. [on sql developer with test1 user ] update name and surname of students

	1. update student set name='anonymous', surname='a surname'  ;

L. [on sql developer with test1 user ] update name and surname of student having student id = 1 before granting select , you will get error because select grant not be given on these columns 

	1. update student set name='anonymous', surname='a surname'  where studentid=1;

M. [on sql developer with myhospital user] giving select privilege on student to test1 

	1. grant select  on student to test1;

N. [on sql developer with test1 user ] update name and surname of student having student id = 1 after granting select 

	1. update student set name='anonymous', surname='a surname'  where studentid=1;

O. [on sql developer with myhospital user] revoking all privilege on employee from test1

	1. revoke all on employee from test1;
	