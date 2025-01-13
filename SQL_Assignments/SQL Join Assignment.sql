create table EmpDetail1(Emp_id int,FirstName varchar(max),LastName varchar (max),Salary int,Department varchar(max),Gender varchar(max))
create table ProDetail1(Pro_id int,EmpD_Id int,Project_Name varchar(max))
select * from EmpDetail1
select * from ProDetail1

--1	Get Employee Name, Project Name order by firstname from "EmployeeDetail" and "ProjectDetail"for those Employee 
--which have assigned project already. 
select EmpDetail1.Emp_id,EmpDetail1.FirstName,EmpDetail1.Department,ProDetail1.Project_Name from EmpDetail1  -----------1
inner join ProDetail1
on Emp_id=EmpD_Id
order by EmpDetail1.FirstName

--4	Get Employee Record (Employeename, project name)from both tables ([EmployeeDetail],[ProjectDetail]),if no match 
--found in any table then show null.
select EmpDetail1.Emp_id,EmpDetail1.FirstName,EmpDetail1.Department,ProDetail1.Project_Name from EmpDetail1 ------4
full join ProDetail1
on Emp_id=EmpD_Id
order by FirstName
----------------------------------------------------------------------------------------------------------------------------
--2	Get Employee Name, Project Name order by firstname from "EmployeeDetail" and "ProjectDetail"for those
--Employee even they have not assigned project.
select EmpDetail1.Emp_id,EmpDetail1.FirstName,EmpDetail1.Department,ProDetail1.Project_Name from EmpDetail1      --------2
left join ProDetail1
on Emp_id=EmpD_Id
where ProDetail1.Project_Name is null
order by EmpDetail1.FirstName
---------------------------------------------------------------------------------------------------------------------------
--3	Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail".
select EmpDetail1.Emp_id,EmpDetail1.FirstName, ProDetail1.Project_Name from EmpDetail1 ------3
right join ProDetail1
on Emp_id=EmpD_Id
where EmpDetail1.Emp_id is null
order by FirstName

