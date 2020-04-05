--##############################################################
-- Hi dear friends, This file is about dropping objects 
-- on oracle database 

-- prerequisites
	--run scripts in 4-Create_Table.sql file 

--##############################################################

--drop synonym 

drop public synonym patient;

--drop table 

drop table doctors;

--By running below script, you can see the objects you drop before in the recyclebin

select * from dba_recyclebin where owner = 'USER_NAME';

-- if you want to drop an object completely, run this code 

drop table inspections cascade;


-- drop user
drop user user_name;

