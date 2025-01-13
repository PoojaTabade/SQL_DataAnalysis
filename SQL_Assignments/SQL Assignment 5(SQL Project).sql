-------------------------------Assignment -5-----------------------------------------------

--1.Create University Database give any University name you want

create database PuneUniversity

--2. Under this University Create four tables and each table should have following three Column named as:-

create table College_Table1(College_ID int primary key,College_Name varchar(max),College_Area varchar(max))
select * from College_Table1

create table Department_Table1(Dept_ID int primary key,Dept_Name varchar(max),Dept_Facility varchar(max))
select * from Department_Table1

create table Professor_Table1(Professor_ID int primary key,Professor_Name varchar(max),Professor_Subject varchar(max))
select * from Professor_Table1

create table Student_Table1(Student_ID int primary key,Student_Name varchar(max),Student_Stream varchar(max))
select * from Student_Table1

--3. Apply foreign key on Department key from College_table
alter table Department_Table1 add  foreign key (Dept_ID) references College_table1(College_ID)

--4. Apply foreign Key on Student_Table from Professor_Table
alter table Student_Table1 add  foreign key (Student_ID) references Professor_Table1(Professor_ID)

--5. Insert atleast 10 Records in each table
select * from College_Table1
select * from Department_Table1
select * from Professor_Table1
select * from Student_Table1

----------------------------Task 2----------------------------------------------------------------------
--1.	Give the information of College_ID and College_name from College_Table
select College_ID,College_Name from College_Table1

--2.	Show  Top 5 rows from Student table.
select top 5 * from Student_Table1

--3.	What is the name of  professor  whose ID  is 5
select * from Professor_Table1
where Professor_ID=5

--4.	Convert the name of the Professor into Upper case 
select UPPER(Professor_Name) from Professor_Table1

--5.	Show me the names of those students whose name is start with a
select * from Student_Table1
where Student_Name like 'a%'

--6.	Give the name of those colleges whose end with a
select * from College_Table1
where College_Name like '%a'

--7.	 Add one Salary Column in Professor_Table
alter table Professor_Table1 add salary int

update Professor_Table1 set salary=40000 where Professor_ID=1
update Professor_Table1 set salary=45000 where Professor_ID=2
update Professor_Table1 set salary=50000 where Professor_ID=3
update Professor_Table1 set salary=35000 where Professor_ID=4
update Professor_Table1 set salary=42000 where Professor_ID=5
update Professor_Table1 set salary=40000 where Professor_ID=6
update Professor_Table1 set salary=33000 where Professor_ID=7
update Professor_Table1 set salary=38000 where Professor_ID=8
update Professor_Table1 set salary=42000 where Professor_ID=9
update Professor_Table1 set salary=50000 where Professor_ID=10
select * from Professor_Table1

--8.	Add one Contact Column in Student_table
alter table Student_table1 add contact int

update Student_Table1 set contact=1524523 where Student_ID=1
update Student_Table1 set contact=1520900 where Student_ID=2
update Student_Table1 set contact=15209202 where Student_ID=3
update Student_Table1 set contact=1524523 where Student_ID=4
update Student_Table1 set contact=1556452 where Student_ID=5
update Student_Table1 set contact=1798523 where Student_ID=6
update Student_Table1 set contact=1524523 where Student_ID=7
update Student_Table1 set contact=1527653 where Student_ID=8
update Student_Table1 set contact=1522265 where Student_ID=9
update Student_Table1 set contact=1989990 where Student_ID=10


--9.	Find the total Salary of Professor 
select  sum(salary)'TotalSalary' from Professor_Table1

--10.	Change datatype of any one column of any one Table
alter table Professor_Table1 alter column Professor_Subject text

--------------------------Task 3--------------------------------------------------------
--1.	Show first 5 records from Students table and Professor table Combine
select top 5 * from Student_Table1
inner join Professor_Table1
on Student_ID=Professor_ID

--2.	Apply Inner join on all 4 tables together---------------------------------------
select * from College_Tables_Data
join Department_Table1
on College_Tables_Data.College_ID=Department_Table1.Dept_ID
join Professor_Table1
on Department_Table1.Dept_ID=Professor_Table1.Professor_ID
join Student_Table1
on Professor_Table1.Professor_ID=Student_Table1.Student_ID

--3.	Show Some null values from Department table and Professor table.
select * from Department_Table1 
inner join Professor_Table1
on Department_Table1.Dept_ID=Professor_Table1.Professor_ID

--4.	Create a View from College Table  and give those records whose college name starts with C
    create view colg_view
	as
	select College_ID,College_Name from College_Table1
	where College_Name like'a%'
    
	select * from colg_view

--5.Create Stored Procedure  of Professor table whatever customer ID will be given by user it should show whole records of it.
create proc prof
as
begin
select * from Professor_Table1 where Professor_ID=4
end

exec prof

--6.Rename the College_Table to College_Tables_Data .
exec sp_rename 'College_Table1','College_Tables_Data'