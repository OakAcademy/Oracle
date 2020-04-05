--##############################################################
-- Hi dear friends, This file is about creating  
-- a tablespace on oracle database 
--##############################################################


/*
connect pluggable database with sys user as sysdba 
the easiest way to connect pluggable db as sysdba is defining a tnsname record for the pluggable database.
the other way is using sql developer, you can use sql developer to directly connect pluggable database 
*/

--create tablespace commands 

CREATE TABLESPACE <tablespace_name>
   DATAFILE 'C:\path\to\dbf\file\tbsXX.dbf' SIZE 1024M
   AUTOEXTEND ON NEXT 100M MAXSIZE 4096M;

