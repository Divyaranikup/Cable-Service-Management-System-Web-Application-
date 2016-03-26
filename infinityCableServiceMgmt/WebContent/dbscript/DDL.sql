-- drop db if exists
DROP DATABASE IF EXISTS infinityCableServiceDb;
-- create db if does not exists
CREATE DATABASE IF NOT EXISTS infinityCableServiceDb;
-- use the db
USE infinityCableServiceDb;

-- drop table if exists
drop table if exists user;

-- create user tables
CREATE TABLE user 
			(user_id		INT			AUTO_INCREMENT   	PRIMARY KEY ,
			 first_name     VARCHAR(100) 	NOT NULL,
			 last_name      VARCHAR(100)    	NOT NULL,
             email_address 	VARCHAR(60)    	NOT NULL,
             phone_number LONG NOT NULL,
             address1 VARCHAR(150),
             address2 VARCHAR(150),
             city VARCHAR(35),
             state VARCHAR(35),
             pincode INT,
             password VARCHAR(25) not null,
             role_id enum('Admin','Customer') not null,
             status enum('A','I') not null,
             user_create_date datetime default now() not null) ;

insert into user(first_name,last_name,email_address,phone_number,password,role_id,status,user_create_date) 
values('Ramesh','Chelliah','rchellia@uncc.edu','7049536205','Valliammal@7god','Admin','A',now());


-- drop table if exists
drop table if exists package;
            
-- create Package table
            
CREATE TABLE package
			(p_id		INT			AUTO_INCREMENT   	PRIMARY KEY ,
			 p_name     VARCHAR(100) unique	NOT NULL,
             p_description	VARCHAR(250)    	NOT NULL,
             p_price double NOT NULL,
             p_status enum ('Active','Inactive') not null,
             p_created_date datetime not null,
             p_deleted_date datetime default null
             );
             
-- drop table if exists
drop table if exists channel;

-- create channel table
 CREATE TABLE channel
			(c_id	INT			AUTO_INCREMENT   	PRIMARY KEY ,
			 c_name     VARCHAR(100) unique	NOT NULL,
           --  c_description	VARCHAR(250)    	NOT NULL,
             c_price double NOT NULL,
             c_status enum ('Active','Inactive') not null,
             c_HD enum ('Y','N') not null
             );
             
-- drop table if exists
drop table if exists package_channel;
             
-- create package-channel table

 CREATE TABLE package_channel
			(p_id	INT	not null ,
			 c_id  Int not null,
             primary key(p_id,c_id),
             foreign key (p_id)
				references package(p_id)
                on delete cascade,
             foreign key (c_id)
				references channel(c_id)
             );