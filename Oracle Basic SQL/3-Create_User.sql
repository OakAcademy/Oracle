--##############################################################
-- Hi dear friends, This file is about creating user  
-- on oracle database  
--##############################################################


/*
connect pluggable database with sys user as sysdba 
the easiest way to connect pluggable db as sysdba is defining a tnsname record for the pluggable database.
the other way is using sql developer, you can use sql developer to directly connect pluggable database 

Here,you will put user_name, user_password and tablespace_name 
*/


CREATE USER user_name 
IDENTIFIED BY user_password
DEFAULT TABLESPACE tablespace_name
TEMPORARY TABLESPACE temp;

--privileges
grant connect, resource, dba to user_name ;

grant unlimited tablespace to user_name;

-- you need to give authorization on tablespace to user for being able to create tables 
alter user user_name quota 1024M on tablespace_name;

