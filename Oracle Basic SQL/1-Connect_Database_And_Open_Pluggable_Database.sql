--##############################################################
-- Hi dear friends, This file is about connecting a newly 
-- installed oracle database as admin and opening 
-- the pluggable database 
--##############################################################

--open a command prompt ( On windows cmd/On Linux Bash), run below command to connect database as system administrator, you will have connected to container database

sqlplus / as sysdba 



--If you check to create a pluggable database when install, lets look at our pluggable databases' open_mode 

select name,open_mode from v$containers;



--if your pluggable databases open_mode is not "READ WRITE" then run below command to open it 

alter pluggable database <pluggable_database_name> open;



--Every time you start  the oracle database, you need manually open your pluggable database by running above command
-- if you want your pluggable database to open automatically, you need to run below command 

alter pluggable database <pluggable_database_name> save state;

