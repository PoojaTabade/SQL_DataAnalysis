create table Employee5(Emp_id int,firstN varchar(max),LastN varchar(max),email varchar(max),PhoneN varchar(max),HireDate date,job_id varchar(max),salary int,commission int,
mang_id int,Depart_id int)
select * from Employee5
drop table Employee5

create table Emp10(Emp_id int,firstN varchar(max),LastN varchar(max),email varchar(max),PhoneN varchar(max),HireDate date,job_id varchar(max),salary int,commission int,
mang_id int,Depart_id int)
select * from Emp10

create table Depart5(Depat_id int,DepartN varchar(max),Manag_id int,location_id int)
select* from Depart5

create table Location(Loc_id int,streetA varchar(max),postal_code varchar (max),city varchar(max),
state varchar(max),country_id varchar(max))
select * from Location

create table Jongrade(Gradelevel varchar(max),Lowesr_sal int,highest_sal int)
select* from Jongrade

create table Location(Loc_id int,streetA varchar(max),postak_code varchar(max),
city varchar(max),state varchar(max),country_id varchar(max))
select * from Location

---1)1-	write a SQL query to find the first name, last name, department number, and department name for each employee.

select Emp10.firstN,Emp10.LastN,Depart5.Depat_id as 'Depart Number',Depart5.DepartN from Emp10
inner join Depart5
on Emp10.Depart_id=Depart5.Depat_id-------------------------------------1

--2)2-	write a SQL query to find the first name, last name, department, city, and state province for each employee.

(select Employee5.firstN,Employee5.LastN,Employee5.Emp_id,Depart5.Depat_id as 'Depart Number',Depart5.DepartN,Depart5.location_id from Employee5
full join Depart5
on Employee5.Depart_id=Depart5.Depat_id
left join
(select Depart5.Depat_id,Depart5.DepartN,Depart5.location_id,Location.city,Location.state from Depart5
full join Location
on Depart5.location_id=Location.Loc_id)------------------------------------2

---3)write a SQL query to find the first name, last name, salary, and job grade for all employees.

select Emp10.firstN,EMP10.LastN,Emp10.salary,Jongrade.Gradelevel from Emp10
inner join Jongrade
on Emp10.salary =Jongrade.Lowesr_sal

--4)4-	write a SQL query to find all those employees who work in department ID 80 or 40. Return first name, 
--------last name, department number and department name.

select Emp10.firstN,Emp10.LastN,Depart5.Depat_id,Depart5.DepartN from Emp10
inner join Depart5
on Emp10.Depart_id=Depart5.Depat_id
where Depart5.Depat_id in('80','40')