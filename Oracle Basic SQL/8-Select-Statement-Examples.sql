--##############################################################
-- Hi dear friends, This file is about retrieving data using 
-- SELECT statement on oracle database

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

		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 1,'james','smith',1000,'01 May 1983', 'HR','jmrsmith@zoracle.com', '(111) 998 88 21',4);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 2,'JAMES','GOLD',3500,'12 Mar 1971', 'Management','jgold12@zoracle.com', '99999 8819',null);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 3,'MARY','Slim',4500,'31 Aug 1982', 'Management','abc_def@zoracle.com', '(888) 283 88 11',2);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 4,'Ken','Rhytym',1500,'23 Apr 1970', 'HR','abcdef@zoracle.com', '(9991) 992 881',null);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 5,'Paula','SMITH',5500,'01 Jun 1991', 'Management','paulasmth@zoracle.com', '(9991) 91 88 88',2);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 6,'Larry','DEEN',3750,'02 Jul 1992', 'HR','Larrydeeen@zoracle.com', '99199 999',4);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 7,'Chris','Been',4400,'03 Feb 1982', 'IT','chrisb@zoracle.com', '(123) 0299209',8);
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

	-- list a table with all columns
	select * from employee;

	-- list some columns 
	select name, surname,salary from employee;

	-- display aliases  instead of column names
	select employeeid empid, name as nameofemployee, surname "Surname of Employee", dateofbirth 
	from employee

	-- display employee their name is james 
	select * from employee where name = 'james'

	-- display employee their name is JAMES  (to emphasize case sensitivity in data)
	select * from employee where name = 'JAMES'

	--list records their department id HR and salary between 3000 and 5000.
	select * from employee where department = 'HR' and salary between 3000 and 5000

	-- list records their department is Managetment or salary is greater then 8000.
	select * from employee where department = 'Management' or salary > 8000

	-- list records their department is HR and salary less then 2000 OR their department is Management and salary greater then 4000
	select * from employee where (department='HR' and salary<2000) or (department='Management' and salary>4000)

