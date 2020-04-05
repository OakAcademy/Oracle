--##############################################################
-- Hi dear friends, This file is about joining tables 
-- on oracle database

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


	-- list doctors and their departments information
	select * from doctors doc inner join departments dep
			on ( doc.departmentid = dep.departmentid)
			
	-- list name , position, departmentname and campus columns from doctors and departments join 		
	select doc.name, doc.position, dep.departmentname, dep.campus from doctors doc inner join departments dep
			on ( doc.departmentid = dep.departmentid)

	-- old style inner join (it have same results just prior example )
	select doc.name, doc.position, dep.departmentname, dep.campus 
	from doctors doc , departments dep
	where  doc.departmentid = dep.departmentid 

	--left outer join, all records of doctors come, only matched records of department come 
	select doc.name, doc.position, dep.departmentname, dep.campus from doctors doc  left outer join departments dep
			on ( doc.departmentid = dep.departmentid)

	-- old style left outer join (it have same results just prior example )
	select doc.name, doc.position, dep.departmentname, dep.campus 
	from doctors doc  , departments dep
	where  doc.departmentid = dep.departmentid(+) 

	--right outer join, all records of departments come, only matched records of doctors come 
	select doc.name, doc.position, dep.departmentname, dep.campus from doctors doc  right outer join departments dep
			on ( doc.departmentid = dep.departmentid)
			
	-- old style left outer join (it have same results just prior example )	
	select doc.name, doc.position, dep.departmentname, dep.campus 
	from doctors doc  ,departments dep
	where  doc.departmentid(+)  = dep.departmentid

	--full outer join, all records of all tables come even if not matched 
	select doc.name, doc.position, dep.departmentname, dep.campus from doctors doc  full outer join departments dep
			on ( doc.departmentid = dep.departmentid)

	--cross join, if we have two tables, table1 with 5 rows and table2 with 7 rows, cross join of these two table returns 35 rows  
	select doc.name, doc.position, dep.departmentname, dep.campus from doctors doc cross join departments dep

	--natural join, done with column with same name in both tables 
	select * from doctors natural join departments

	-- in natural join, joining columns come first order 
	select * from inspections natural join patients


	--self join, table can be joined itself  
	select emp.name,emp.surname,emp.department,mng.name manager_name, mng.surname manager_surname
	from employee emp join employee mng 
	on ( emp.managerid = mng.employeeid)		

	-- consolidation 

	--list diagnostic information of patients that Doctor David McGrey inspected.
	select p.name, p.address, p.phone, det.diagnostic from patients p join inspections i on (p.patientId = i.patientid )
							join inspectiondetails det on ( i.inspectionId = det.inspectionId )
							join doctors doc on (i.doctorId = doc.doctorId)
	where doc.name = 'David McGrey'                        

	-- get list of how many inspections done by department, please report it. 
	select dep.departmentname, count(i.inspectionid) inspection_count  from inspections i join doctors d on ( i.doctorid = d.doctorid)
					join departments dep on ( dep.departmentid = d.departmentid )
	group by dep.departmentname                

	-- List address, phone and diagnostics of the patients that treated in surgery department and sort by patient id descending. 
	select  p.name, p.address, p.phone, det.diagnostic  from patients p inner  join inspections i on (p.patientid = i.patientid)
				inner join inspectiondetails det on (i.inspectionid = det.inspectionid)
				inner join doctors doc on (i.doctorid = doc.doctorid)
				inner join departments dep on (dep.departmentid = doc.departmentid)
	where dep.departmentname = 'Surgery'            
	order by p.patientid desc

	-- list inspection counts by day.
	select to_char(inspectiondate, 'dd mon yyyy') day, count(*) from inspections 
	group by to_char(inspectiondate, 'dd mon yyyy') 


