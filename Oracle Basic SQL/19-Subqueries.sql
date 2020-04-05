--##############################################################
-- Hi dear friends, This file is about subqueries

-- you need to run table initialization scripts to create tables 
-- then you can run examples without problem
--##############################################################


--------- start of table initialization scripts ------------------------------------

		drop table doctors cascade constraints purge;

		drop table patients cascade constraints purge;

		drop table Departments cascade constraints purge;

		drop table inspections cascade constraints purge;

		drop table inspectiondetails cascade constraints purge;

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
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 6,'Larry','DEEN',null,'02 Jul 1992', 'HR','Larrydeeen@zoracle.com', '99199 999',4);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 7,'Chris','Been',null,'03 Feb 1982', 'IT','chrisb@zoracle.com', '(123) 0299209',8);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 8,'Levis','Brian',8700,'14 Sep 1982', 'IT','levbri@zoracle.com', '(999) 0100 12 2',null);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 9,'Cordi','Klun',4500,'17 Apr 1977', 'HR','cordikl@zoracle.com', '(889) 999 01 23',4);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 10,'Berr','Gerr',4600,'18 Oct 1979', 'HR','berrger@zoracle.com', '(888) 888 23 23',4);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 11,'Klint','Kris',4800,'20 Nov 1981', 'IT','klintkr@zoracle.com', '(778) 888 89 89',8);
		insert into employee (employeeid , name , surname , salary , dateofbirth , department , email , phone,managerId) values ( 12,'Noah','Thura',8100,'21 Dec 1977', 'IT','noahtha@zoracle.com', '(788) 999 9900',8);


		create table doctors (doctorId number, name varchar2(50), position varchar2(100), departmentId Number, ManagerDoctorId number);

		alter table doctors add( constraint doctors_pk primary key (doctorId));

		insert into doctors (doctorId , name , position , departmentId , ManagerDoctorId ) values ( 1,'David McGrey','Attending Physician',1,6);
		insert into doctors (doctorId , name , position , departmentId , ManagerDoctorId ) values ( 2,'Michael Smith','Senior Attending Physician',2,null);
		insert into doctors (doctorId , name , position , departmentId , ManagerDoctorId ) values ( 3,'George Miller','Staff Internist',1,6);
		insert into doctors (doctorId , name , position , departmentId , ManagerDoctorId ) values ( 4,'Eva Wilson','Surgical Attending Physician',2,2);
		insert into doctors (doctorId , name , position , departmentId , ManagerDoctorId ) values ( 5,'Bill Green','Staff Internist',1,6);
		insert into doctors (doctorId , name , position , departmentId , ManagerDoctorId ) values ( 6,'Leia Black','Attending Physician',1,null);
		insert into doctors (doctorId , name , position , departmentId , ManagerDoctorId ) values ( 7,'Keira Hunter','Staff Internist',null,null);



		create table patients (patientId number, name varchar2(50), address varchar2(150), phone varchar2(15));

		alter table patients add( constraint patients_pk primary key (patientid));

		insert into patients(patientid , name , address , phone ) values ( 1,'John Thin','2271  Sundown Lane, Austin, TX 78749','999-888-22-11');
		insert into patients(patientid , name , address , phone ) values ( 2,'Mary Garcia','95 Greystone St. Austin, TX 78749','999-822-90-11');
		insert into patients(patientid , name , address , phone ) values ( 3,'Aaron Wilson','111 Yellow Statue St. Austin, TX 78749','999-801-01-02');
		insert into patients(patientid , name , address , phone ) values ( 4,'Elizabeth Taylor','24 Marsh St. Austin, TX 78749','999-880-00-11');
		insert into patients(patientid , name , address , phone ) values ( 5,'Amanda Lee','123 Hall Avenue, Austin, TX 78749','999-880-00-91');
		insert into patients(patientid , name , address , phone ) values ( 6,'Mark Robinson','77 West Talbot St. Austin, TX 78749','999-808-09-08');
		insert into patients(patientid , name , address , phone ) values ( 7,'John Thin','121 BlackChain St. Austin, TX 78749','999-900-10-12');
		insert into patients(patientid , name , address , phone ) values ( 8,'Carlos Keyton','334 Pearl St. Austin, TX 78749','999-909-22-32');
		insert into patients(patientid , name , address , phone ) values ( 9,'Edmond Icon','12 Dorothy St. Austin, TX 78749','991-909-09-12');

		create table Departments ( departmentId number, departmentname varchar2(150), campus varchar2(50));

		alter table departments add( constraint departments_pk primary key (departmentId));

		insert into departments (departmentId , departmentname , campus ) values ( 1,'General Medicine','Site A');
		insert into departments (departmentId , departmentname , campus ) values ( 2,'Surgery','Site B');
		insert into departments (departmentId , departmentname , campus ) values ( 3,'Management Office','Site C');


		create table inspections ( inspectionid number, doctorid number, patientid number, inspectiondate date);

		alter table inspections add( constraint inspections_pk primary key (inspectionid));

		insert into inspections (inspectionid , patientid , doctorid , inspectiondate ) values ( 101,1,1,to_date('04 Dec 2018 Tuesday','dd-mon-yyyy DAY'));
		insert into inspections (inspectionid , patientid , doctorid , inspectiondate ) values ( 102,2,2,to_date('03 Dec 2018 Monday','dd-mon-yyyy DAY'));
		insert into inspections (inspectionid , patientid , doctorid , inspectiondate ) values ( 103,3,1,to_date('04 Dec 2018 Tuesday','dd-mon-yyyy DAY'));
		insert into inspections (inspectionid , patientid , doctorid , inspectiondate ) values ( 104,4,3,to_date('02 Dec 2018 Sunday','dd-mon-yyyy DAY'));
		insert into inspections (inspectionid , patientid , doctorid , inspectiondate ) values ( 105,5,3,to_date('02 Dec 2018 Sunday','dd-mon-yyyy DAY'));
		insert into inspections (inspectionid , patientid , doctorid , inspectiondate ) values ( 106,6,1,to_date('04 Dec 2018 Tuesday','dd-mon-yyyy DAY'));
		insert into inspections (inspectionid , patientid , doctorid , inspectiondate ) values ( 107,7,4,to_date('05 Dec 2018 Wednesday','dd-mon-yyyy DAY'));


		create table inspectiondetails (inspectiondetailid number, inspectionid number, diagnostic varchar2(100));

		alter table inspectiondetails add( constraint inspectiondetails_pk primary key (inspectiondetailid));

		insert into inspectiondetails (inspectiondetailid , inspectionid , diagnostic ) values ( 1001,101,'flu');
		insert into inspectiondetails (inspectiondetailid , inspectionid , diagnostic ) values ( 1002,102,'incision');
		insert into inspectiondetails (inspectiondetailid , inspectionid , diagnostic ) values ( 1003,103,'cold');
		insert into inspectiondetails (inspectiondetailid , inspectionid , diagnostic ) values ( 1004,103,'diarrhea');
		insert into inspectiondetails (inspectiondetailid , inspectionid , diagnostic ) values ( 1005,104,'cold');
		insert into inspectiondetails (inspectiondetailid , inspectionid , diagnostic ) values ( 1006,105,'flu');
		insert into inspectiondetails (inspectiondetailid , inspectionid , diagnostic ) values ( 1007,106,'bronchitis');
		insert into inspectiondetails (inspectiondetailid , inspectionid , diagnostic ) values ( 1008,106,'flu');
		insert into inspectiondetails (inspectiondetailid , inspectionid , diagnostic ) values ( 1009,107,'fracture');

		commit;

		alter table doctors add ( constraint doctors_department_fk foreign key (departmentId) references departments (departmentId));

		alter table inspections add ( constraint inspections_doctor_fk foreign key (doctorId) references doctors (doctorId));

		alter table inspections add ( constraint inspections_patient_fk foreign key (patientId) references patients (patientId));

		alter table inspectiondetails add ( constraint insdetail_ins_fk foreign key (inspectionId) references inspections (inspectionId));


--------- end of table initialization scripts ----------------------------------------------------------------


-----------------------------------------------------------------
-----------------------------------------------------------------
--------- EXAMPLES ----------------------------------------------


	-- Using subqueries , get doctors and patients count 
	select (select count(*) from doctors) doctors_count,
		(select count(*) from patients) patients_count
	from dual	

	-- using subquery in from clause , "inline view"
	select a.* from (select name, surname from employee where upper(name) like 'J%') a

	--list employee earn highest salary 1/2
	select * from employee where salary = (select max(salary) from employee)

	--list managers 2/2
	select * from employee e where e.employeeid in ( select managerid from employee)

	-- correlated subquery, using it in SELECT clause, get doctor and patient information  
	select i.inspectiondate,(select doc.name from doctors doc where i.doctorid = doc.doctorid) as doctor,
		(select p.name from patients p where p.patientid = i.patientid) as patient
		from inspections i

	-- correlated subquery in where clause, get employees having max salary for each department
	select * from employee e 
	where e.salary = ( select max(salary) from employee ee where ee.department= e.department)


		
	-- update inspectioncount column with subquery 
		--fist we add a column to  be updated (inspectioncount column stores inspectioncount of each doctor)
		alter table doctors add inspectioncount number;	

		-- inspect table 
		select * from doctors

		-- update newly added column using subqueries 
		update doctors d set inspectioncount = (select count(*) from inspections i where i.doctorid = d.doctorid)
		where d.doctorid in ( select doctorid from inspections )

		-- to control above operation we run two query 
		--1. inspect newly added column values 
		select doctorid, inspectioncount from doctors order by 2 desc nulls last, 1 ;

		--2. and compare them original inspection count from inspections table 
		select doctorid, count(*) from inspections group by doctorid order by 2 desc , 1 nulls last ;


	-- update firstinspectiondate and lastinspectiondate column with subquery approach 1	
		select * from doctors

		alter table doctors add ( firstinspectiondate date, lastinspectiondate date);

		update doctors d set (firstinspectiondate,lastinspectiondate) = (select min(inspectiondate) , max(inspectiondate) from inspections i where d.doctorid = i.doctorid)
		where d.doctorid in (select doctorid from inspections)

	-- update firstinspectiondate and lastinspectiondate column with subquery approach 2	

		select * from doctors

		update doctors set firstinspectiondate = null, lastinspectiondate = null

		update  ( select d.doctorid, d.firstinspectiondate, d.lastinspectiondate,  
								i.min_date, i.max_date
								from doctors d join 
												( select doctorid, min(inspectiondate) min_date, max(inspectiondate) max_date 
														from inspections 
														group by doctorid) i
								on (d.doctorid=i.doctorid)
						)
		set  firstinspectiondate = min_date, lastinspectiondate = max_date

		-- to control 
		select * from doctors

		
	-- delete with subquery, delete doctor records that not in inspections table 

	delete doctors d where d.doctorid not in ( select doctorid from inspections )

