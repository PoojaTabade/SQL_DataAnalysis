create table EMP(EmpNo int,Ename varchar(max),Designation varchar(max),salary int,mgr int,Dno int)
create table Department (Departno int,Dname varchar(max),loc varchar(max))
select* from EMP
select * from Department
--1.	Amongst Manager who Gets Highest Salary?
select max(salary) 'MaxSal' from EMP-------------------------------1

--2.	Get the Details of Clerk earning 5000?
select Empno,Ename,Designation,salary ,mgr,Dno from EMP
where salary='5000'------------------------------------------------2

--3.	Which Designation has exactly 2 employees?
select Designation,mgr from EMP
where mgr=2-----------------------------------------------------------3

--4.	Which Designation has the greatest number of Employees?
select  max(mgr)'max' from EMP-------------------------------4

--5.	Which Designation has the Least?
select designation,min(mgr)'min'from EMP----------------------------5

--6.	What is the Second Highest Salary?
select  * FROM EMP Where salary<max(salary) --------------------------------------------6

--7.	Who gets the Second Highest Salary?
select Ename,max(salary) from EMP
where Ename=salary<max(salary)'employee'----------------------------7