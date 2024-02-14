
-- This project is the cretion of the database of an imaginary family owned compagny.
--we want to create the employee table, the positions and salaries of employees, a customer list and some transactions made by the customers.
--- when the database will be set, we will ask ourselves questions 


create database Chez_Jay_Sandwich_database


-- create the employees table with employee_id as primary. 
create table employees (
	[employee_id] int identity(1,1) primary key,
	[first_name] varchar(50) not null,
	[last_name] varchar(50) not null,
	[sex] varchar(50) not null,
	[date_of_birth] date not null,
	[phone_number] varchar(50),
	[email] varchar(100)
	)


-- let's populate the table wih random
insert into employees( first_name, last_name, sex, date_of_birth, phone_number, email)
values 
	('Alexus', 'Nguema Ollomo', 'Feminin', '03/07/1999', '320-079-7649', 'Alexusl@yahoo.com'),
	('Alayah Danielle', 'Ntsame Nguema', 'Feminin', '05/02/1999', '456-786-444', 'Alayah@yahoo.com'),
	('Teagan', 'Schultz', 'Feminin', '03/03/1999', '657-345-9876', 'Teagan@yahoo.com'),
	('Sara', 'Schultz', 'Feminin', '01/01/1999', '657-234-8756', 'Sara@yahoo.com'),
	('Rodolpho', 'Rodriguez','Masculin', '01/02/1999', '345-132-6387', 'Rodolpho@yahoo.com'),
	('Jennifer', 'Schultz', 'Feminin', '12/12/1999', '234-567-1960', 'Jennifer@yahoo.com')

-- We modidy the last name of one of the employees
update employees
set last_name ='Rodriguez'
where first_name = 'sara'

--The new table with new data
select *
from employees  

-- Create the table for the positions and salaries with pisition_id as primary and employee_id as foreign 
create table Positions_and_salaries(
	[position_id] int identity(100, 25) primary key,
	[position] varchar(50) not null,
	[employee_id] int not null,
	foreign key (employee_id) references employees(employee_id),
	[salary] decimal(6, 2) not null
	)


insert into Positions_and_salaries ( position, employee_id, salary)
values ( 'CEO', '1', '2000'),
	( 'MANAGER', '8', '1000'),
	( 'CO-MANAGER', '9', '950'),
	('WORKER', '11', '500'),
	('WORKER', '12', '500'),
	('WORKER', '13', '500'),
	('WORKER', '13', '500')

update Positions_and_salaries
set employee_id = '14'
where position_id = '250'

select *
from Positions_and_salaries

-- the table connecting the employees and their positions and salaries
select * from Positions_and_salaries inner join employees
on Positions_and_salaries.employee_id = employees.employee_id


-- create a customer table
create table customers(
	[customer_id] int identity(3,3) not null primary key,
	[first_name] varchar (50) not null,
	[last_name] varchar (50) not null,
	[sex] varchar (50),
	[date_of_birth] date,
	[email] varchar (100) not null,
	[address] varchar (100)
	)

--let's insert random customers names
insert into customers (first_name, last_name, sex, date_of_birth, email, address)
values ('Guy', 'Blonchar', 'Masculin', '1895/01/01', 'guy@yahoo.com', ' 24 rue bressigny'),
	('Ange', 'Blon', 'Masculin', '1895/02/01', 'uy@yahoo.com', ' 25 rue Antoloupe'),
	('Marthe', 'Ambouroue', 'Feminin', '1897/01/08', 'gy@yahoo.com', ' 28 rue Cascade'),
	('Yan', 'Bbnr', 'Masculin', '1295/11/06', 'hmguy@yahoo.com', ' 214 rue Brintelle'),
	('Yaelle', 'Paelle', 'Feminin', '1795/01/01', 'gthfhuy@yahoo.com', ' 624 rue Etincelle'),
	('Guy', 'Normand', 'Masculin', '1885/09/03', 'gurygkopy@yahoo.com', ' 294 rue Mondae'),
	('Anny', 'Palace', 'Feminin', '1893/10/01', 'gutttty@yahoo.com', ' 234 rue Alcace')

select *
from customers



-- create the transaction table with Transaction_id primary key and customer_id foreign key
create table Transactions(
	[transaction_id] int identity(2, 8) not null primary key,
	[item] varchar (50) not null,
	[amount] decimal (5, 2) not null,
	[customer_id] int not null
	)


-- let's add a foreign key to transaction table
alter table transactions
add constraint fk_customer_id
foreign key (customer_id) references customers(customer_id)


--let's add imaginary data in the transaction table
insert into Transactions (item, amount, customer_id)
values ('Borrito Ragu', '15.5', '21'),
	('Bowl Ragu', '10.5', '3'),
	('Borrito Ragu', '15.5', '9'),
	('Chicken red rice', '12.5', '6'),
	('chicken white rice', '11.5', '15'),
	('Beff White rice', '9.5', '18'),
	('Beef red rice', '9.5', '12'),
	('Borrito Ragu', '15.5', '21'),
	('chicken white rice', '12.5', '6'),
	('Chicken red rice', '12.5', '9')

select *
from transactions


--Table connecting the customers and the transactions
select * 
from customers left join Transactions
on customers.customer_id = transactions.customer_id


-- let's create a table of the employees that authorized the transactions with authorization_id as primary and tghe other 2 foreign keys
 create table Authorized_transactions( 
	[authorization_id] int identity (5, 5) not null primary key,
	[transaction_id] int not null,
	foreign key (transaction_id) references transactions(transaction_id),
	[employee_id] int not null,
	foreign key (employee_id) references employees(employee_id)
	) 

--let's put some data in the newly created table
insert into Authorized_transactions (transaction_id, employee_id)
values ( '2', '9'),
	('10', '1'),
	('34', '12'),
	('66', '14'),
	('74', '8'),
	('50', '11'),
	('58', '13'),
	('42', '11'),
	('18', '9'),
	('26', '12')

-- let's check if the table is completed
select *
from Authorized_transactions


-- let's change collumn name in the employees table
sp_rename 'employees.first_name', 'employ_first_name'
sp_rename 'employees.last_name', 'employ_last_name'

-- let's change collumn name in the customers table
sp_rename 'customers.first_name', 'custom_first_name'
sp_rename 'customers.last_name', 'custom_last_name'

--let's check our tables
select *
from employees 

select *
from Positions_and_salaries

select *
from customers

select *
from transactions

select *
from Authorized_transactions

-- In this SQL project, I created a database for a small sandwich shop composed of 5 tables: employees, customers, positions and salaries, transactions and  the authorized transactions

