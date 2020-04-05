--##############################################################
-- Hi dear friends, This file is about Exists and Not Exists  
-- statement with SELECT statement on oracle database

-- you need to run table initialization scripts to create tables 
-- then you can run examples without problem
--##############################################################


--------- start of table initialization scripts ------------------------------------

	drop table doctors cascade constraints purge;

	drop table patients cascade constraints purge;

	drop table Departments cascade constraints purge;

	drop table inspections cascade constraints purge;

	drop table inspectiondetails cascade constraints purge;



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

		--list doctors exists in inspections table 
		select * from doctors d where exists ( select 1 from inspections i where d.doctorid = i.doctorid)

		--list doctors not exists in inspections table 
		select * from doctors d where not exists ( select 1 from inspections i where d.doctorid = i.doctorid)

		--using exists inside case when 
		select d.name, ( case when exists ( select 1 from inspections i 
																						where d.doctorid = i.doctorid )
												then 'YES' 
												else 'NO'
										end) as inspection_exists
		from doctors d
