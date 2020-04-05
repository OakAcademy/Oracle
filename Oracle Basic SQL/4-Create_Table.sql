--##############################################################
-- Hi dear friends, This file is about creating table 
-- on oracle database
--##############################################################

-- here are some example table creation scripts, you need to specify a tablespace_name or just remove "tablespace tablespace_name" statement each script 
-- to be able to create tables 

create table doctors
(doctorid number,
name varchar2(50),
position varchar2(100))
tablespace tablespace_name;


create table inspections
(inspectionid number,
patientid number,
doctorid number,
inspectiondate date)
tablespace tablespace_name;


create table patient
(patientid number,
name varchar2(50),
adress varchar2(150),
phone varchar2(10))
tablespace tablespace_name;


create table inspectiondetail
(inspectiondetailid number,
inspectionid number,
diagnosticname varchar2(100))
tablespace tablespace_name;


create table department
(departmentid number,
departmentname varchar2(150),
campus varchar2(50))
tablespace tablespace_name;

