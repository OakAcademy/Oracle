--##############################################################
-- Hi dear friends, This file is about schema objects
-- on oracle database

-- you need to run table initialization scripts to create tables 
-- then you can run examples without problem
--##############################################################


--------- start of table initialization scripts ------------------------------------

	drop table customer cascade constraints purge;

	CREATE table customer (customerId number, name varchar2(50), surname varchar2(50),dateofbirth date);

	insert into customer (customerid , name , surname , dateofbirth ) values ( 1,'susan','Dark',to_date('01 may 1982 01:23','dd-mon-YYYY hh24:mi'));
	insert into customer (customerid , name , surname , dateofbirth ) values ( 2,'mary','Green',to_date('23 mar 1985 23:12','dd-mon-YYYY hh24:mi'));
	insert into customer (customerid , name , surname , dateofbirth ) values ( 3,'gary','Elfrod',to_date('8 apr 1991 15:54','dd-mon-YYYY hh24:mi'));
	insert into customer (customerid , name , surname , dateofbirth ) values ( 4,'carlos','Sontana',to_date('9 nov 1972 23:21','dd-mon-YYYY hh24:mi'));
	insert into customer (customerid , name , surname , dateofbirth ) values ( 5,'david','park',to_date('19 dec 1983 04:28','dd-mon-YYYY hh24:mi'));
	insert into customer (customerid , name , surname , dateofbirth ) values ( 6,'michael','collin',to_date('14 jan 1989 13:23','dd-mon-YYYY hh24:mi'));


	drop table doctors cascade constraints purge;

	drop table patients cascade constraints purge;

	drop table Departments cascade constraints purge;

	drop table inspections cascade constraints purge;

	drop table inspectiondetails cascade constraints purge;

	drop table employee cascade constraints purge ;

	drop table countryresources cascade constraints purge;

	create table countryresources (resourceid number, resourcename varchar2(50), country varchar2(50));
	alter table countryresources  add ( constraint countryresources_pk primary key (resourceid));

	insert into countryresources (resourceid, resourcename, country) values (1,'coal','USA');
	insert into countryresources (resourceid, resourcename, country) values (2,'oil','USA');
	insert into countryresources (resourceid, resourcename, country) values (3,'natural gas','USA');
	insert into countryresources (resourceid, resourcename, country) values (4,'iron','USA');
	insert into countryresources (resourceid, resourcename, country) values (5,'copper','USA');
	insert into countryresources (resourceid, resourcename, country) values (6,'uranium','USA');
	insert into countryresources (resourceid, resourcename, country) values (7,'bauxite','USA');
	insert into countryresources (resourceid, resourcename, country) values (8,'manganese','USA');
	insert into countryresources (resourceid, resourcename, country) values (9,'lead','USA');
	insert into countryresources (resourceid, resourcename, country) values (10,'tin','USA');
	insert into countryresources (resourceid, resourcename, country) values (11,'gold','USA');
	insert into countryresources (resourceid, resourcename, country) values (12,'silver','USA');
	insert into countryresources (resourceid, resourcename, country) values (13,'zinc','USA');
	insert into countryresources (resourceid, resourcename, country) values (14,'oil','RUSSIA');
	insert into countryresources (resourceid, resourcename, country) values (15,'natural gas','RUSSIA');
	insert into countryresources (resourceid, resourcename, country) values (16,'iron','RUSSIA');
	insert into countryresources (resourceid, resourcename, country) values (17,'copper','RUSSIA');
	insert into countryresources (resourceid, resourcename, country) values (18,'zinc','RUSSIA');
	insert into countryresources (resourceid, resourcename, country) values (19,'lead','RUSSIA');
	insert into countryresources (resourceid, resourcename, country) values (20,'aluminum','RUSSIA');
	insert into countryresources (resourceid, resourcename, country) values (21,'magnesium','RUSSIA');
	insert into countryresources (resourceid, resourcename, country) values (22,'titanium','RUSSIA');
	insert into countryresources (resourceid, resourcename, country) values (23,'gold','RUSSIA');
	insert into countryresources (resourceid, resourcename, country) values (24,'platinum','RUSSIA');
	insert into countryresources (resourceid, resourcename, country) values (25,'antimony','RUSSIA');
	insert into countryresources (resourceid, resourcename, country) values (26,'diamond','RUSSIA');

	commit;


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
------------------       EXAMPLES    ----------------------------


	------------------------------------------
	--create view, that lists doctors and their departments knowledge.  
	create view docdepart_view as 
	select d.doctorid, d.name,  d.position, dep.departmentname, dep.campus  
	from doctors d join departments dep
		on ( d.departmentid = dep.departmentid)
	   
		-- inspect,  does your view work correctly
		select *from docdepart_view;

	-- create view that retrieves patients and their inspections knowledge

	create view patient_ins_view as 
		select p.name, p.address, p.phone, i.inspectiondate, d.diagnostic from 
		patients p join inspections i on ( p.patientid = i.patientid )
		join inspectiondetails d on ( i.inspectionid = d.inspectionid )
			
		--inspect, does your view work correctly 
		select * from patient_ins_view;
			

	-- create user defined function, that determines whether a number is positive or negative 
	create or replace function determine_sign_func ( p_number number)
	return varchar2
	is
	begin
	if (p_number >= 0 ) then 
		return 'POSITIVE';
	else 
		return 'NEGATIVE';
	end if;

	end;
	 
		--test your newly created function 
		
		 select determine_sign_func(100) from dual
		 
		 select determine_sign_func(-100) from dual
		 
	 --------------------------------------
	--sequence, old style auto increment column handling in oracle 

		1. create the table 

		 create table cars ( 
		 id number, 
		 brand varchar2(50),
		 model varchar2(50));
		 
		 alter table add (constraint cars_pk primary key (id));

		2. create a sequence to increase id column by the trigger 

		create sequence cars_sequence start with 1 increment by  1 maxvalue  99999999; 

		3. create a trigger to increase id column every insert 

		create or replace trigger cars_trigger 
		before insert on cars 
		for each row 
		begin

			select cars_sequence.nextval into :new.id
			from dual;

		end;


		4. insert records to inspect insfrastructure work well

		insert into cars (brand, model) values ('FORD', 'Mustang');

		insert into cars (brand, model) values ('TESLA', 'Model S');

		5. to control 

		select * from cars ;

		select cars_sequence.nextval from dual

	-- new style auto increment handling in oracle 

		1.first clear previous operations leftovers

		drop table cars;
		drop sequence cars_sequence;

		2. create table with new style, take attention "DEFAULT ON NULL AS IDENTITY" here, it is new style for handling auto increment 
		create table cars (
		id number generated by DEFAULT ON NULL AS IDENTITY,
		brand varchar2(50),
		model varchar2(50));

		3. insert records to inspect insfrastructure work well
		insert into cars (brand, model) values ('FORD', 'Mustang');

		insert into cars (brand, model) values ('TESLA', 'Model S');


		4. to control 

		select * from cars ;
