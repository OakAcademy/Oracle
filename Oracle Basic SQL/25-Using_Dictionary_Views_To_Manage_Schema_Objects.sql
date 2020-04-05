--##############################################################
-- Hi dear friends, This file is about Monitoring/Managing 
-- Schema Objects using Dictionary Views on oracle database

--##############################################################
	 
	-- user_tables and user_tab_columns
		-- user_tables, list your table information 
		select * from user_tables

		--combine with  user_tab_columns , list your tables and their columns information 
		select * from user_tab_columns natural join user_tables 

	--user_views, list views information
	select * from user_views

	--user indexes , list indexes information
	select * from user_indexes

	--user-ind-column, list indexes and their columns 
	select * from user_ind_columns natural join user_indexes

	--user constraints, list columns 
	select * from user_constraints order by table_name

	--user-cons-columns, list columns and their columns
	select *from user_cons_columns natural join user_constraints

	--user-procedures, lists users procedures and functions
	select * from user_procedures

	--user-source, stores functions, procedures and triggers scripts by line number
	select * from user_source
