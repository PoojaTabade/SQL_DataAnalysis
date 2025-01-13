create database HR

CREATE TABLE Regions (region_id INT PRIMARY KEY,region_name VARCHAR (25) DEFAULT NULL)

INSERT INTO Regions(region_id,region_name) 
VALUES (1,'Europe');
INSERT INTO regions(region_id,region_name) 
VALUES (2,'Americas');
INSERT INTO regions(region_id,region_name) 
VALUES (3,'Asia');
INSERT INTO regions(region_id,region_name) 
VALUES (4,'Middle East and Africa');

select * from Regions

-----------------------------------2----------------------------------------------------
CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR (40) DEFAULT NULL,
	region_id INT NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE)

INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('ZW','Zimbabwe',4);

select * from countries

------------------------------------------------3-------------------------------------------------------
CREATE TABLE locations (
	location_id INT PRIMARY KEY,
	street_address VARCHAR (40) DEFAULT NULL,
	postal_code VARCHAR (12) DEFAULT NULL,
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');

 select * from locations


 ------------------------------------------------------------4-----------------------------------------------------------
 CREATE TABLE jobs (
	job_id INT PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL);

INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (19,'Stock Manager',5500.00,8500.00);

select * from jobs

-------------------------5------------------------------------------------------------------------------------
CREATE TABLE departments (
	department_id INT PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO departments(department_id,department_name,location_id)
 VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (11,'Accounting',1700);

select * from departments

------------------------------------------------6-----------------------------------------------------
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT DEFAULT NULL,
	department_id INT DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
 VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11);

 select * from employees

 -------------------------------------------------------7------------------------------------------------------

 CREATE TABLE dependents (
	dependent_id INT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (30,'Sandra','Taylor','Child',176);

select * from dependents
select * from jobs
select * from employees
select * from countries
select * from Regions
select * from locations
select * from departments
---------------------------------------TASK-1------------------------------------------
--A.	To get data from all the rows and columns in the employees table:
select * from employees

--B.	select data from the employee id, first name, last name, and hire date of all rows in the employees table:
Select employee_id,first_name,last_name,hire_date from employees

--C.	to get the first name, last name, salary, and new salary:
Select first_name,last_name,salary from employees

--D.	Increase the salary two times and named as New_SALARY from employees table.
Select *,salary*2 as 'New salary'  from employees
---------------------------------------------------------------------
--2)A.	returns the data from the employee id, first name, last name, hire date, and salary column of the employees table:
Select employee_id,first_name,last_name,hire_date ,salary from employees

--B.	to sort employees by first names in alphabetical order:
select * from employees
order by first_name

--C.	to sort the employees by the first name in ascending order and the last name in descending order:
select * from employees
order by first_name,
last_name desc

--D.	to sort employees by salary from high to low:
select * from employees
order by salary desc

--E.	to sort the employees by values in the hire_date column from:
select * from employees
order by hire_date

--F.	sort the employees by the hire dates in descending order:
select * from employees
order by hire_date desc
---------------------------------------------------3---------------------------------------------
--A.	selects the salary data from the salary column of the employees table and sorts them from high to low:
 select salary from employees
order by salary desc
--B.	select unique values from the salary column of the employees table:
select distinct salary from employees

--C.	selects the job id and salary from the employees table:
select job_id, salary from employees

--D.	to remove the duplicate values in job id and salary:
select distinct job_id, salary from employees

--E.	returns the distinct phone numbers of employees:
select distinct phone_number from employees
----------------------------------------------------------------4------------------------------
--A.	returns all rows in the employees table sorted by the first_name column.
select* from employees
order by first_name

--B.	to return the first 5 rows in the result set returned by the SELECT clause:
SELECT TOP 5 [employee_id]
      ,[first_name]
      ,[last_name]
      ,[email]
      ,[phone_number]
      ,[hire_date]
      ,[job_id]
      ,[salary]
      ,[manager_id]
      ,[department_id]
  FROM [HR].[dbo].[employees]

  SELECT TOP 5 *
FROM employees;


  --C.	to return five rows starting from the 4th row:

--D.	gets the top five employees with the highest salaries.
with result as
(
select *,
ROW_NUMBER() over(order by salary desc)'RN' from employees
)
select * from result
where result.RN in (1,2,3,4,5)

---way2
select top 5* from employees
order by salary desc

--E.	to get employees who have the 2nd highest salary in the company
with result as
(
select *,
ROW_NUMBER() over(order by salary desc)'RN' from employees
)
select * from result
where result.RN =2

--way2 subquery
select max(salary) from employees
where salary<(select max(salary) from employees)

-------------------------------------------------------5--------------------------------------------------------
--A.	query finds employees who have salaries greater than 14,000 and sorts the results sets based on the salary in descending order.
select * from employees
where salary>14000
order by salary desc

--B.	query finds all employees who work in the department id 5.
select* from employees
where department_id=5

--C.	query finds the employee whose last name is Chen
select* from employees
where last_name='Chen'

--D.	To get all employees who joined the company after January 1st, 1999
select* from employees
where hire_date> '1999-01-01'

--E.	to find the employees who joined the company in 1999,
select* from employees
where year(hire_date)='1999'

--F.	statement finds the employee whose last name is Himuro
select * from employees
where last_name ='Himuro'

--G.	the query searches for the string Himuro in the last_name column of the employees table.
select * from employees
where last_name ='Himuro'

--H.	to find all employees who do not have phone numbers:
select * from employees
where phone_number is null

--I.	returns all employees whose department id is not 8.
select * from employees
where department_id!=8

--J.	finds all employees whose department id is not eight and ten.
select * from employees
where department_id not in(8,10)

--K.	to find the employees whose salary is greater than 10,000,
select * from employees
where salary > 10000

--L.	finds employees in department 8 and have the salary greater than 10,000:
select * from employees
where department_id=8 and salary > 10000

--M.	the statement below returns all employees whose salaries are less than 10,000:
select * from employees
where salary < 10000

--N.	finds employees whose salaries are greater than or equal 9,000:
select * from employees
where salary >= 9000

--O.	finds employees whose salaries are less than or equal to 9,000:
select * from employees
where salary <= 9000

--------------------------------------------------6-----------------------------------------------------------

create table courses(course_id int not null,course_name varchar(max))
select* from courses

--A.	adds a new column named credit_hours to the courses table.
alter table courses add  credit_hours time

--B.	adds the fee and max_limit columns to the courses table and places these columns after the course_name column.
alter table courses add fee int

ALTER TABLE courses ADD  max_limit INT

--C.	changes the attribute of the fee column to NOT NULL.
alter table courses alter column fee int not null

--D.	to remove the fee column of the courses table
alter table courses drop column fee

--E.	removes the max_limit and credit_hours of the courses table.
alter table courses drop column max_limit,credit_hours

-----------------------------------------6 foreign key----------------------------
CREATE  TABLE  projects (
    project_id  INT  PRIMARY KEY,
    project_name  VARCHAR(255),
    start_date  DATE  NOT NULL,
    end_date  DATE  NOT NULL
);

CREATE  TABLE  project_milestones(
    milestone_id  INT  PRIMARY KEY,
    project_id   INT,
    milestone_name VARCHAR(100)
);

select * from projects
select * from project_milestones

--A.	--to add an SQL FOREIGN KEY constraint to the project_milestones table to enforce the relationship between the 
--projects and project_milestones tables.
alter table project_milestones add foreign key (project_id) references projects(project_id)

--B.	Suppose the project_milestones already exists without any predefined foreign key and you want to define a FOREIGN KEY constraint 
--for the project_id column so write a Query to add a FOREIGN KEY constraint to existing table

alter table project_milestones add foreign key (project_id) references projects(project_id)



-------------------------------------------------------------------------------------------------------------
---------------------------------------------------TASK2-------------------------------------------------
------------------------------------------------PART--1--------------------------------------------------
--A.	finds all employees whose salaries are greater than 5,000 and less than 7,000:
select* from employees
where salary between 5000 and 7000

--B.	finds employees whose salary is either 7,000 or 8,000:	
select* from employees
where salary =   5000 or salary=7000

--C.	finds all employees who do not have a phone number:
select * from employees
where phone_number is null

--D.	finds all employees whose salaries are between 9,000 and 12,000.
select* from employees
where salary between 9000 and 12000

--E.	finds all employees who work in the department id 8 or 9.
select* from employees
where department_id=8 or department_id=9

--F.	finds all employees whose first name starts with the string jo
select* from employees
where first_name like 'jo%'

--G.	finds all employees with the first names whose the second character is  h
select* from employees
where first_name like '_h%'

--H.	finds all employees whose salaries are greater than all salaries of employees in the department 8:
select * from employees 
where salary >all(select salary from employees where department_id=8)

------------------------------------------PART--2-----------------------------------
--A.	finds all employees whose salaries are greater than the average salary of every department:
select * from employees 
where salary >all(select avg(salary) from employees group by department_id)

--B.	finds all employees who have dependents:
select * from dependents

--C.	to find all employees whose salaries are between 2,500 and 2,900:
select* from employees
where salary between 2500 and 2900

--D.	to find all employees whose salaries are not in the range of 2,500 and 2,900:
select* from employees
where salary between 2500 and 2900

--E.	to find all employees who joined the company between January 1, 1999, and December 31, 2000:
select* from employees
where hire_date between '1999-01-01' and '2000-12-31'

--F.	to find employees who have not joined the company from January 1, 1989 to December 31, 1999:
select* from employees
where hire_date not between '1999-01-01' and '2000-12-31'

--G.	to find employees who joined the company between 1990 and 1993:
select* from employees
where hire_date  between '1990' and '1993'

-------------------------------------------PART--3--------------------------------------
--A.	to find all employees whose first names start with Da
Select * from employees
where first_name like 'Da%'

--B.	to find all employees whose first names end with er
Select * from employees
where first_name like '%er'

--C.	to find employees whose last names contain the word an:
Select * from employees
where last_name like '%an%'

--D.	retrieves employees whose first names start with Jo and are followed by at most 2 characters:
Select * from employees
where first_name like 'Jo__%'

--E.	to find employees whose first names start with any number of characters and are followed by at most one character:
Select * from employees
where first_name like '%_'

--F.	to find all employees whose first names start with the letter S but not start with Sh:
Select * from employees
where first_name like 'S%' and first_name not like 'Sh%'

-------------------------------PART--4---------------------------------------
--A.	retrieves all employees who work in the department id 5.
Select * from employees
where department_id=5

--B.	To get the employees who work in the department id 5 and with a salary not greater than 5000.
Select * from employees
where department_id=5
and salary<5000

--C.	statement gets all the employees who are not working in the departments 1, 2, or 3.
Select * from employees
where department_id in (1,2,3)

--D.	retrieves all the employees whose first names do not start with the letter D.
Select * from employees
where first_name not like 'D%'

--E.	to get employees whose salaries are not between 5,000 and 1,000.
Select * from employees
where  salary not between 1000 and 5000

-------------------------------------------------------PART--5------------------------
--A.	Write a query to get the employees who do not have any dependents by above image
select e.employee_id,e.first_name,e.last_name,d.dependent_id,d.employee_id from employees e
left join dependents d
on e.employee_id=d.employee_id

--B.	To find all employees who do not have the phone numbers
select * from employees
where  phone_number is null

--C.	To find all employees who have phone numbers
select *,phone_number from employees

----------------------------------------------------------TASK--3--------------------------------------------
--A.	To get the information of the department id 1,2, and 3
select e.employee_id,e.department_id,e.first_name ,d.department_name from employees e
inner join departments d
on e.department_id=d.department_id
where e.department_id in(1,2,3)

--B.	To get the information of employees who work in the department id 1, 2 and 3
select * from employees
where department_id in(1,2,3)

--Write a Query to get the first name, last name, job title, and department name of employees who work in department id 1, 2, and 3.
select e.job_id, e.first_name,e.last_name, j.job_title,j.job_id from employees e
inner join jobs j
on e.job_id=j.job_id
inner join departments d
on e.job_id=d.department_id
where d.department_id in(1,2,3)

--A.	To query the country names of US, UK, and China
select country_name from countries
where country_id in ('UK','US','CN')

--B.	query retrieves the locations located in the US, UK and China:
select street_address from locations
where country_id in ('UK','US','CN')

--C.	To join the countries table with the locations table
select c.country_id,c.country_name,l.country_id,l.city from countries c
inner join locations l
on c.country_id=l.country_id

--D.	to find the country that does not have any locations in the locations table
select c.country_id,c.country_name,l.country_id,l.city,l.street_address from countries c
left join locations l
on c.country_id=l.country_id

--------employee table Q-------------------------
--The manager_id column specifies the manager of an employee. Write a query  statement to  joins the employees table to
--itself to query the information of who reports to whom.

select  e1.first_name,e1.last_name as employee,e2.first_name,e2.last_name as manager from employees e1 
join employees e2 
on e1.manager_id=e2.employee_id

-----------------------------------FULL outer join-----------------------------
CREATE  TABLE  fruits (
	fruit_id  INT PRIMARY KEY,
	fruit_name  VARCHAR (255) NOT NULL,
	basket_id  INTEGER
);
CREATE TABLE baskets (
	basket_id  INT PRIMARY KEY,
	basket_name  VARCHAR (255) NOT NULL
);

INSERT  INTO  baskets  (basket_id, basket_name)
VALUES
	(1, 'A'),
	(2, 'B'),
	(3, 'C');

INSERT  INTO  fruits (
	fruit_id,
	fruit_name,
	basket_id
)
VALUES
	(1, 'Apple', 1),
	(2, 'Orange', 1),
	(3, 'Banana', 2),
	(4, 'Strawberry', NULL);

select* from baskets
select * from fruits

--A.	Write a query to  returns each fruit that is in a basket and each basket that has a fruit, 
--but also returns each fruit that is not in any basket and each basket that does not have any fruit.
select b.basket_id,b.basket_name, f.fruit_name from baskets b
full outer join fruits f
on b.basket_id=f.basket_id

--B.	Write a query to find the empty basket, which does not store any fruit
select b.basket_id,b.basket_name, f.fruit_name from baskets b
full outer join fruits f
on b.basket_id=f.basket_id
where fruit_name is null

--C.	Write a query  which fruit is not in any basket
select b.basket_id,b.basket_name, f.fruit_name from baskets b
full outer join fruits f
on b.basket_id=f.basket_id
where basket_name is null

---------------------------------------------------CROSS JOIN-------------------------------------
CREATE  TABLE  sales_organization (
	sales_org_id  INT PRIMARY KEY,
	sales_org  VARCHAR (255)
);

 CREATE  TABLE  sales_channel (
	channel_id  INT PRIMARY KEY,
	channel  VARCHAR (255)
);

INSERT INTO sales_organization (sales_org_id, sales_org)
VALUES
	(1, 'Domestic'),
	(2, 'Export');

	INSERT INTO sales_channel (channel_id, channel)
VALUES
	(1, 'Wholesale'),
	(2, 'Retail'),
	(3, 'eCommerce'),
	(4, 'TV Shopping');

Select * from sales_organization
Select * from sales_channel

--Write a Query To find the all possible sales channels that a sales organization 
Select * from sales_organization 
cross join sales_channel 

--------------------------------------------------------Group by clause-------------------------------------
--A.	to group the values in department_id column of the employees table:
select department_id from employees
group by department_id

--B.	to count the number of employees by department:
       -----------way-1-------

select COUNT(*), d.department_name from employees e
inner join departments d
on e.department_id=d.department_id
group by d.department_name
         ----------way-2--------
select count(*),department_id from employees
group by department_id

--C.	returns the number of employees by department
select count(*),department_id from employees
group by department_id

--D.	to sort the departments by headcount:
select COUNT(*), d.department_name from employees e
inner join departments d
on e.department_id=d.department_id
group by d.department_name
order by count(*) desc

--E.	to find departments with headcounts are greater than 5:
select COUNT(*), d.department_name from employees e
inner join departments d
on e.department_id=d.department_id
group by d.department_name
having count(*)>5
order by count(*) desc

--F.	returns the minimum, maximum and average salary of employees in each department.
select max(salary) 'max',min(salary)'min',avg(salary)'avg' ,department_id from employees
group by department_id

select d.department_name,max(salary) 'max',min(salary)'min',avg(salary)'avg' from employees e
inner join departments d
on d.department_id=e.department_id
group by department_name




--G.	To get the total salary per department,
select max(salary) 'Total salary',department_id from employees
group by department_id

--H.	groups rows with the same values both department_id and job_id columns in the same group then return the rows for each of these groups
select  count(employee_id)'Total count',d.department_name,j.job_id from employees e
inner join departments d
on e.department_id=d.department_id
inner join jobs j
on d.department_id=j.job_id
group by department_name,j.job_id

---------------------------------------Having Clause---------------------------------------

--A.	To get the managers and their direct reports, and  to group employees by the managers and to count the direct reports.
select COUNT(employee_id)'Direct reports',manager_id from employees
group by manager_id

--B.	To find the managers who have at least five direct reports
select  COUNT(employee_id)'Direct reports', manager_id from employees
group by manager_id
having  COUNT(employee_id) >=5

--C.	calculates the sum of salary that the company pays for each department and 
--selects only the departments with the sum of salary between 20000 and 30000.
select sum(salary)'Total salary',department_id from employees
group by department_id
having sum(salary) between 20000 and 30000

--D.	To find the department that has employees with the lowest salary greater than 10000
select  min(salary)'minimum salary', d.department_name from employees e
inner join departments d
on e.department_id=d.department_id
group by d.department_name
having min(salary) >10000 

--E.	To find the departments that have the average salaries of employees between 5000 and 7000
select avg(salary)'Average salary',d.department_name from employees e
inner join departments d
on e.department_id=d.department_id
group by department_name
having avg(salary) between 5000 and 7000

---------------------------------------------UNION AND UNION ALL----------------------------------------------------
--Write a Query to combine the first name and last name of employees and dependents
select first_name,last_name from employees
union 
select first_name,last_name from dependents

------------------------------------------------------Intersect--------------
create table A(Aid int)
insert into A values (1),(2),(3)

create table B(Bid int)
insert into B values (2),(3),(4)

--Write a Query to  Applies the INTERSECT operator to the A and B tables and sorts the combined result set by the id column in descending order.
Select * from A
intersect
Select * from B

---------------------------------------------EXIST------------------------------
--A.	finds all employees who have at least one dependent.
SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    EXISTS( SELECT 
            1
        FROM
            dependents
        WHERE

            dependents.employee_id = employees.employee_id);

--B . finds employees who do not have any dependents:
SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    NOT EXISTS( SELECT 
            1
        FROM
            dependents
        WHERE
            dependents.employee_id = employees.employee_id);

-----------------------------------------Case Statement----
--A.	Suppose the current year is 2000. How to  use the simple CASE expression to get the work anniversaries of employees by 
SELECT 
    first_name,
    last_name,
    hire_date,
    CASE (2000 - YEAR(hire_date))
        WHEN 1 THEN '1 year'
        WHEN 3 THEN '3 years'
        WHEN 5 THEN '5 years'
        WHEN 10 THEN '10 years'
        WHEN 15 THEN '15 years'
        WHEN 20 THEN '20 years'
        WHEN 25 THEN '25 years'
        WHEN 30 THEN '30 years'
    END aniversary
FROM
    employees
ORDER BY first_name;

--B.	Write a Query  If the salary is less than 3000, the CASE expression returns “Low”. If the salary is between 3000 and 5000, 
--it returns “average”. When the salary is greater than 5000, the CASE expression returns “High”.
select first_name,
      last_name,
case 
   when  salary<300 then 'Low'
   when salary between 3000 and 5000 then 'Average'
   when salary >5000 then 'High'
   end others
   from employees

   --A.	Combine Above two queries using subquery inorder find all departments located at the location whose id is 1700 and 
   --find all employees that belong to the location 1700 by using the department id list of the previous query
  SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    department_id IN (SELECT 
            department_id
        FROM
            departments
        WHERE
            location_id = 1700)
ORDER BY first_name , last_name;

--B.	to find all employees who do not locate at the location 1700:
  SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    department_id NOT IN (SELECT 
            department_id
        FROM
            departments
        WHERE
            location_id = 1700)
ORDER BY first_name , last_name;

--C.	finds the employees who have the highest salary:
select first_name,last_name,salary, employee_id from employees
where salary=(select max(salary) 'Max' from employees)
order by first_name

--D.	finds all employees who salaries are greater than the average salary of all employees:
select first_name,last_name,employee_id,salary from employees
where salary > (select avg(salary)'Average sal' from employees)

--E.	finds all departments which have at least one employee with the salary is greater than 10,000:
SELECT 
    department_name
FROM
    departments d
WHERE
    EXISTS( SELECT 
            1
        FROM
            employees e
        WHERE
            salary > 10000
                AND e.department_id = d.department_id)
ORDER BY department_name; 


--F.	finds all departments that do not have any employee with the salary greater than 10,000:
SELECT 
    department_name
FROM
    departments d
WHERE
    NOT EXISTS( SELECT 
            1
        FROM
            employees e
        WHERE
            salary > 10000
                AND e.department_id = d.department_id)
ORDER BY department_name;  

--G.	to find the lowest salary by department:
select min(salary) from employees
group by department_id
order by min(salary) desc

--H.	finds all employees whose salaries are greater than the lowest salary of every department:
select first_name,last_name ,salary from employees
where salary> all  (select min(salary) from employees
group by department_id)

--I.	finds all employees whose salaries are greater than or equal to the highest salary of every department
select first_name,last_name ,salary from employees
where salary>=all  (select max(salary) from employees
group by department_id)

--J.	returns the average salary of every department
select AVG(salary)'Average',department_id from employees
group by department_id

--K.	to calculate the average of average salary of departments :
SELECT 
    ROUND(AVG(average_salary), 0)
FROM
    (SELECT 
        AVG(salary) average_salary
    FROM
        employees
    GROUP BY department_id) department_salary;

--L.	finds the salaries of all employees, their average salary,
--and the difference between the salary of each employee and the average salary.
SELECT 
    employee_id,
    first_name,
    salary,
    (SELECT AVG(salary) FROM employees) AS average_salary,
    salary - (SELECT AVG(salary) FROM employees) AS salary_difference
FROM 
    employees;
