--##############################################################
-- Hi dear friends, This file is about conversion functions 
-- that you can use with SELECT statement on oracle database

-- you need to run table initialization scripts to create tables 
-- then you can run examples without problem
--##############################################################


--------- start of table initialization scripts ------------------------------------


	drop table employee cascade constraints purge ;

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

	-- retrıevıng data dml scripts
		
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



	drop table student purge;

	create table student (studentId number, name varchar2(50), surname varchar2(50), score number, gender varchar2(10));

	insert into student (studentid , name , surname , score, gender ) values ( 1,'emily','brown',88,'female');
	insert into student (studentid , name , surname , score, gender ) values ( 2,'artur','blink',65,'male');
	insert into student (studentid , name , surname , score, gender ) values ( 3,'anastasia','bryanov',76,'female');
	insert into student (studentid , name , surname , score, gender ) values ( 4,'paul','jackson',89,'male');
	insert into student (studentid , name , surname , score, gender ) values ( 5,'khalil','khan',75,'male');
	insert into student (studentid , name , surname , score, gender ) values ( 6,'irvin','ingza',69,'female');
	insert into student (studentid , name , surname , score, gender ) values ( 7,'claudia','karmen',56,'female');
	insert into student (studentid , name , surname , score, gender ) values ( 8,'John','clark',55,'male');

	commit;

--------- end of table initialization scripts ----------------------------------------------------------------


-----------------------------------------------------------------
-----------------------------------------------------------------
--------- EXAMPLES ----------------------------------------------

	--to char function, conver number to char and display with two digit decimal
	select to_char(1234.43, '9,999.99') as result from dual	   

	--to char function, conver number to char and display with one digit decimal
	select to_char(1234.43, '9,999.9') as result from dual	   

	--to char function when number be converted is too long, this not human readable
	select to_char(1234567890.43, '9,999.9') as result from dual	   


	--to char function when number be converted is too long, you must put mask long enough
	select to_char(1234567890.43, '9,999,999,999,999,999.9') as result from dual	   



	--to char date maskings
	select dateofbirth as dateofbirthoriginal, 
	to_char(dateofbirth, 'YEAR') "YEAR", 
	to_char(dateofbirth, 'YYYY') "YYYY",
	to_char(dateofbirth, 'Q') "Q",
	to_char(dateofbirth, 'MM') "MM",
	to_char(dateofbirth, 'MON') "MON-ABBREVIATED NAME OF MONTH",
	to_char(dateofbirth, 'MONTH') "MONTH-MONTH NAME",
	to_char(dateofbirth, 'DAY') "DAY-DAY NAME",
	to_char(dateofbirth, 'DD') "DD-DAY OF MONTH",
	to_char(dateofbirth, 'DDD') "DDD-DAY OF YEAR",
	to_char(dateofbirth, 'HH') "HH-HOUR OF DAY 1-12",
	to_char(dateofbirth, 'HH24') "HH24-HOUR OF DAY 1-24",
	to_char(dateofbirth, 'MI') "MI-MINUTE",
	to_char(dateofbirth, 'SS') "SS-SECOND",
	to_char(dateofbirth, 'dd.mm.yyyy hh24:mi')
	from employee

	-- display day info in different languages 
	 select to_char(sysdate,'DAY') day_in_default_lang , to_char(sysdate,'DAY','nls_date_language=dutch') day_in_dutch,
	 to_char(sysdate, 'day', 'nls_date_language=french') day_in_french, to_char(sysdate, 'day', 'nls_date_language=icelandic') day_in_icelandic
	 from dual


	--to number 
	-- sum up two string , oracle automatically convert them number 
	select '5' + '10' from dual

	-- sum up two string, one of them inside thousand separator, this query will cause error.
	select '123,344'+'5' from dual

	-- sum up two wtring converted to number by to_number function there is no problem in spite of thousand separator
	select to_number('123,344','999,999')+to_number('5') from dual

	-- to date , display here , birth, death day and how many years lived of Abraham Lincoln
	select to_date('12 feb 1809','dd mon yyyy') birthdayofLincoln,
				to_date('15 apr 1865','dd mon yyyy') deathdayofLincoln,
				round((to_date('15 apr 1865','dd mon yyyy') - to_date('12 feb 1809','dd mon yyyy'))/365) yearslived 
				from dual

	-- decode , salutation example, if gender male then salutation 'Mr.' else if gender female then salutation is 'Ms.' else salutation is 'Dear'
	select name, surname, decode(gender, 'male', 'Mr.', 'female', 'Ms.', 'Dear') salutation from student


	--case when, success grade list 
	-- if score greater or equal to 90 then success grade A
	-- else if score greater or equal to 80 then success grade B
	-- else if score greater or equal to 70 then success grade C
	-- else if score greater or equal to 60 then success grade D
	-- else  unsuccessful

	select name, surname, 
		(case when score >= 90 then 'A'
			when score >= 80 then 'B'
			when score >=70 then 'C'
			when score >= 60 then 'D'
			else 'UNSUCCESSFUL'
			end ) as "success grade", score
	from student        

				
