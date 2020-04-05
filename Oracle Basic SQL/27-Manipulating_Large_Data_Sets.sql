--##############################################################
-- Hi dear friends, This file is about Manipulating Large Data Sets 
--  on oracle database

-- you need to run table initialization scripts to create tables 
-- then you can run examples without problem
--##############################################################


--------- start of table initialization scripts ------------------------------------

		drop table cars purge;

		drop table germany_cars purge;

		drop table audi_cars purge;

		drop table american_cars purge;

		drop table electric_cars purge;

		DROP TABLE tesla_cars PURGE;

		drop table new_products_list purge;

		drop table products purge;


		create table audi_cars ( model varchar2(50), max_speed_mph number);

		insert into audi_cars (model, max_speed_mph) values ( 'A8', 140); 
		insert into audi_cars (model, max_speed_mph) values ( 'R8', 200); 
		insert into audi_cars (model, max_speed_mph) values ( 'ETRON', 124); 



		create table cars (country varchar2(50), brand varchar2(50), model varchar2(50), max_speed_mph number);

		create table germany_cars ( brand varchar2(50), model varchar2(50), max_speed_mph number);




		create table electric_cars (country varchar2(50), brand varchar2(50), model varchar2(50), max_speed_mph number);

		insert into electric_cars(country,brand,model,max_speed_mph) values('USA','TESLA','MODEL S',140);
		insert into electric_cars(country,brand,model,max_speed_mph) values('USA','FORD','FOCUS ELECTRIC',84);
		insert into electric_cars(country,brand,model,max_speed_mph) values('USA','CHEVROLET','BOLT',93);


		create table tesla_cars ( model varchar2(50), max_speed_mph number);

		create table american_cars (brand varchar2(50), model varchar2(50), max_speed_mph number);


		create table products (id number, product varchar2(50), price number );

		alter table products add ( constraint products_pk primary key (id));

		insert into products (id, product, price) values (1, 'T-shirt', 8);
		insert into products (id, product, price) values (2, 'Blouse', 18);
		insert into products (id, product, price) values (3, 'Sweater', 60);
		insert into products (id, product, price) values (4, 'Office Skirt', 50);
		insert into products (id, product, price) values (5, 'Jacket', 88);

		create table new_products_list (id number, product varchar2(50), price number );

		alter table new_products_list add ( constraint new_products_list_pk primary key (id));

		insert into new_products_list  (id, product, price) values (1, 'T-shirt', 9);
		insert into new_products_list (id, product, price) values (2, 'Blouse', 22);
		insert into new_products_list (id, product, price) values (5, 'Jacket', 77);
		insert into new_products_list (id, product, price) values (6, 'Man Shoes', 40);
		insert into new_products_list (id, product, price) values (7, 'Woman Shoes', 55);


		commit;

--------- end of table initialization scripts ----------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
----------EXAMPLES --------------------------------------------------

-- insert select 
A. create temp_store table without data

	create table temp_store as select * from audi_cars  where 1=2; 

B. control temp_store table
 
	select * from temp_store;

C. fill temp_store table with insert select

	insert into temp_store select * from audi_cars;


-- fill cars and germany_cars tables using insert all unconditional
A. insert audi_cars data into cars and germany_cars using insert all 

	insert all
	into cars values ('GERMANY', 'AUDI', model, max_speed_mph)
	into germany_cars values ('AUDI', model, max_speed_mph)
	select * from audi_cars;

B. control cars table after filling
  
	select * from cars;

C. control germany_cars table after filling

	select * from germany_cars;


--fill tesla_cars and american_cars tables using insert all conditional
A. insert electric cars data into tesla_cars and american_cars using insert all conditional

	INSERT all 
	when brand = 'TESLA' then
	into tesla_cars values (model, max_speed_mph)
	WHEN country = 'USA' then
	into american_cars values (brand, model, max_speed_mph)
	select *from electric_cars;

B. control tesla_cars table after filling
 
	select * from tesla_cars
  
C. control american_cars table after filling

	select * from american_cars


--fill tesla_cars and american_cars using insert first.
A. empty tesla_cars before insert first
  
	truncate table tesla_cars
  
B. empty american_cars before insert first

	truncate table american_cars

C. insert electric_cars data into tesla_cars and american_cars using insert first 
	
	INSERT first
	when brand = 'TESLA' then   
	into tesla_cars values (model, max_speed_mph)
	WHEN country = 'USA' then
	into american_cars values (brand, model, max_speed_mph)
	select * from electric_cars;

D. control tesla_cars table after filling
  
	select * from tesla_cars

E. control american_cars table after filling

	select * from american_cars



-- renew products table using merge statement
A. renew products records with new_products_list table using merge statement

	merge into products p
	using new_products_list  np
	on ( p.id = np.id) 
	WHEN MATCHED then
	update set p.price = np.price
	when not matched then
	insert ( id,  product, price)
	values ( np.id, np.product, np.price)


--track table changes
A. see table changes using VERSIONS between statement

	select * from employee 
	VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE
	where employeeid= 1

B. make some changes

	update employee set name ='Xames' where employeeid=1;

C. see again table changes 

	select * from employee 
	VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE
	where employeeid= 1


D. you can see current SCN (System Change Number) value of oracle

	select timestamp_to_scn(sysdate)  from dual