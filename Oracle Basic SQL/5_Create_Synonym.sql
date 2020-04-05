--##############################################################
-- Hi dear friends, This file is about creating synonym 
-- on oracle database, to run these commands without error
-- you need to run scripts in the previous file 

-- requirements
	-- run scripts in 4-Create_Table.sql
--##############################################################


create public synonym doctors for doctors;

create public synonym inspections for inspections;

create public synonym patient for patient;

create public synonym department for department;

create public synonym inspectiondetail for inspectiondetail;

