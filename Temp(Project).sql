create database Temp

Create table Employee(Empid int not null,Fname varchar(max),Lname varchar(max),salary int,Jdate date,
Department varchar(max),Gender varchar(max))

insert into Employee values(1,'Vikas','Ahlawat',600000,'2013-02-12','IT','Male'),(2,'Nikita','Jain',530000,'2013-02-14','HR','Female'),
(3,'Ashish','Kumar',1000000,'2013-02-14','IT','Male'),(4,'Nikhil','Sharma',480000,'2013-02-15','HR','Male')
,(5,'Anish','Kadian',500000,'2013-02-16','Payroll','Male')

--1) Write a query to get all employee detail from "EmployeeDetail" table
   select * from Employee

--2) Write a query to get only "FirstName" column from "EmployeeDetail" table
   select Fname from Employee

--3) Write a query to get FirstName in upper case as "First Name".
   select UPPER(Fname) as "First Name" from Employee

--5) Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)
   select * , CONCAT(Fname,'  ',Lname) as "Name" from Employee

 --6) Select employee detail whose name is "Vikas
   select * from Employee where Fname='Vikas'

--7) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.
  select * from Employee where Fname like 'a%'

--9. Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'
  select * from Employee where Fname like '%h'

--10. Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'
    select * from Employee where Fname like '%[a-p]'

--11) Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'
      select * from Employee where Fname not like '%[a-p]'

--12) Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. 
--    The Underscore(_) Wildcard Character represents any single character
      select * from Employee where Gender like '__le%'

--13) Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters
      select * from Employee where Fname  like '%[a____]'

--14)	 Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".
           select * from Employee where Fname  like 'Vik%as'

--15)	 Get all unique "Department" from EmployeeDetail table 
        select distinct Department from Employee

--16)	 Get the highest "Salary" from EmployeeDetail table.
    select max(salary)  'Max Sal'from Employee

--17)	 Get the lowest "Salary" from EmployeeDetail table
      select min(salary)  'Low Sal'from Employee

--18)	 Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013
SELECT FORMAT(JDate, 'dd MMM yyyy') AS FormattedDate
FROM Employee

--19)	Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"
  SELECT FORMAT(JDate, 'yyyy MMM dd') AS FormattedDate
FROM Employee

--20)	 Show only time part of the "JoiningDate"

--21)	Get only Year part of "JoiningDate"
  SELECT YEAR(Jdate) AS Year
FROM Employee

--22)	Get only Month part of "JoiningDate”
  SELECT Month(Jdate) AS Year
FROM Employee

--23)	Get system date
select GETDATE()'system date'

--25)	Get the first name, current date, joiningdate and diff between current date and joining date in days.
SELECT 
    Fname,
    CAST(GETDATE() AS DATE) AS CurrentDate,
    Jdate,
    DATEDIFF(DAY, Jdate, GETDATE()) AS DaysDifference
FROM Employee

--26)	 Get all employee details from EmployeeDetail table whose joining year is 2013
 select* from Employee where year(Jdate)= '2013'

 --27)	Get all employee details from EmployeeDetail table whose joining month is Jan(1)
      select* from Employee where month(Jdate)= 01

--29)	Get how many employee exist in "EmployeeDetail" table
 select COUNT(Empid) as 'total emp' from Employee

 --31. Select only one/top 1 record from "EmployeeDetail" table
 SELECT TOP 1 [Empid]
      ,[Fname]
      ,[Lname]
      ,[salary]
      ,[Jdate]
      ,[Department]
      ,[Gender]
  FROM [Temp].[dbo].[Employee]

 --32. Select all employee detail with First name "Vikas","Ashish", and "Nikhil".
     select * from  Employee where Fname in ( 'Vikas','Ashish', 'Nikhil') 

--33. Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil"
     select * from  Employee where Fname not in ( 'Vikas','Ashish', 'Nikhil') 

--34. Select first name from "EmployeeDetail" table after removing white spaces from right side
SELECT RTRIM(Fname) AS FirstNameWithoutSpaces
FROM Employee

--35. Select first name from "EmployeeDetail" table after removing white spaces from left side
SELECT LTRIM(Fname) AS FirstNameWithoutSpaces
FROM Employee

--36. Display first name and Gender as M/F.(if male then M, if Female then F)
select *,Fname,
case Gender
when 'Male' then 'M'
when 'Female' then 'F'
else 'other'
end 'Remarks'
from Employee

--37. Select first name from "EmployeeDetail" table prifixed with "Hello
select 'Hello'+ (Fname) as 'FName' from Employee 


--38. Get employee details from "EmployeeDetail" table whose Salary greater than 600000
select salary from Employee where salary> 600000

--39. Get employee details from "EmployeeDetail" table whose Salary less than 700000
select salary from Employee where salary<700000

--40. Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000
select * from Employee where salary between 500000 and 600000
----------------------------------------------------------------------------------------------------------------
create table Project(Pid int not null,Eid int not null,Pname varchar(max))

insert into Project values(1,1,'Task Track'),(2,1,'CLP'),(3,1,'Surway Management'),(4,2,'HR Management'),
(5,3,'Task Track'),(6,3,'GRS'),(7,3,'DDS'),(8,4,'HR Management'),(9,6,'GL Management')

--41. Give records of ProjectDetail table
select * from Project

--42. Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table.
select Department,sum(salary)'Total salary' from Employee
group by Department

--43. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.
select Department,sum(salary)'Total salary' from Employee
group by Department
order by 'Total salary' asc

--45. Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table.
select Department ,COUNT(*),sum(salary) from Employee
group by Department

--46. Get department wise average salary from "EmployeeDetail" table order by salary ascending
select Department,AVG(salary)'Sal' from Employee
group by Department
order by 'Sal'

--47 . Get department wise maximum salary from "EmployeeDetail" table order by salary ascending
select Department,max(salary)'Sal' from Employee
group by Department
order by 'Sal'

--48.Get department wise minimum salary from "EmployeeDetail" table order by salary ascending.
select Department,min(salary)'Sal' from Employee
group by Department
order by 'Sal'

--50. Join both the table that is Employee and ProjectDetail based on some common paramter
select E.Empid,E.Fname,E.Department,P.Pid,P.Pname from Employee E
inner join Project P
on E.Empid=P.Eid

--51. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" 
--for those employee which have assigned project already.
select E.Empid,E.Fname,E.Department,P.Pname,P.Eid from Employee E
right join Project P
on  E.Empid=P.Eid
order by E.Fname

--52. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" 
--for all employee even they have not assigned project.
select E.Empid,E.Fname,E.Department,P.Pname,P.Eid from Employee E
right join Project P
on  E.Empid=P.Eid
where E.Empid is null
order by E.Fname



--53) Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee 
--if project is not assigned then display "-No Project Assigned"

--54.Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail
select E.Empid,E.Fname,E.Department,P.Pname,P.Eid from Employee E
left join Project P
on  E.Empid=P.Eid
order by E.Fname

--55. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), 
--if no match found in any table then show NULL
select E.Empid,E.Fname,E.Department,P.Pname,P.Eid from Employee E
FULL join Project P
on  E.Empid=P.Eid

--58.Write down the query to fetch EmployeeName & Project who has assign more than one project
select E.Empid,E.Fname,P.Pname,count(P.Pid) 'count' from Employee E
right join Project P
on  E.Empid=P.Eid
group by P.Pid 
having count(P.Pid)>1

--59. Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName

SELECT e.Fname, e.Empid, p.Pid, p.Pname, p.Eid
FROM Employee e
JOIN Project p
ON e.Empid = p.Eid
WHERE p.Pid IN (
    SELECT Pid
    FROM Project
    GROUP BY Pid
    HAVING COUNT(Eid) > 1
)

--60. Apply Cross Join in Both the tables
select * from Employee
cross join 
Project




