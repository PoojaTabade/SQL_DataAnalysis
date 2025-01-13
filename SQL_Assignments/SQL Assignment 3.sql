 ----Assignment-1

 create table EmployeeD(Empid int,FullName varchar (max),mangid int,DateOfJoining date,city varchar(max))

  select * from EmployeeD
  insert into EmployeeD values(121,'John Snow',321,'2019-01-31','Toronto')
  insert into EmployeeD values(321,'Water White',986,'2020-01-30','California')
  insert into EmployeeD values(421,'Kuldeep Rana',876,'2021-11-27','New Delhi')
 drop table EmployeeD
   create table EmployeeSal(Emp_ID int,project varchar(max),sal int,variable int)
  select * from EmployeeSal
  insert into EmployeeSal values(121,'p1',8000,500)
  insert into EmployeeSal values(321,'p1',10000,1000)
  insert into EmployeeSal values(421,'p1',12000,0)
  
  select * from EmployeeD
  select * from EmployeeSal

  --Q1)SQL Query to fetch records that are present in one table but not in another table.

  select EmployeeD.Empid,EmployeeD.FullName,EmployeeD.mangid,EmployeeSal.project from EmployeeD
  left join EmployeeSal
  on EmployeeD.Empid=EmployeeSal.Emp_ID
-----------------------------------------------------------------------------------------------------------
 -- Q2)SQL query to fetch all the employees who are not working on any project.
 
  select EmployeeD.Empid,EmployeeD.FullName,EmployeeD.mangid,EmployeeSal.project from EmployeeD
  left join EmployeeSal
  on EmployeeD.Empid=EmployeeSal.Emp_ID
  where EmployeeSal.project=NULL
-------------------------------------------------------------------------------------------------------------------
 -- Q3)SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.
 select * from EmployeeD
 where DateOfJoining='2020'

 --Q4)Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.
   select EmployeeD.Empid,EmployeeD.FullName,EmployeeD.mangid,EmployeeD.DateOfJoining, EmployeeSal.sal from EmployeeD
   left join EmployeeSal
   on EmployeeD.Empid=EmployeeSal.Emp_ID

   --Q5)Write an SQL query to fetch a project-wise count of employees.
     select project ,COUNT(Emp_ID)'Total count' from EmployeeSal
	 group by project
	 order by 'Total count' asc        

-- Q6)Fetch employee names and salaries even if the salary value is not present for the employee.
select EmployeeD.FullName,EmployeeSal.Emp_ID,EmployeeSal.sal from EmployeeD
inner join EmployeeSal
on EmployeeD.empid=EmployeeSal.Emp_ID

--Q7)Write an SQL query to fetch all the Employees who are also managers.
select * from EmployeeD 
where (empid in(select mangid from EmployeeD))

--Q8)Write an SQL query to fetch duplicate records from EmployeeDetails.
  SELECT Empid, COUNT(Empid) FROM EmployeeD
  GROUP BY Empid
  HAVING COUNT(Empid) > 1

--Q9)Write an SQL query to fetch only odd rows from the table.
with Result as
(
select Empid,
DENSE_RANK() over (order by Empid)'Row' from EmployeeD
)
select Empid from Result
where Result.Row%2=1
          

--Q10)Write a query to find the 3rd highest salary from a table without top or limit keyword.
with Result as
(
select sal,
DENSE_RANK() over(order by sal desc)'highest sal'
from EmployeeSal
)
select sal from Result
where Result.[highest sal] =3


  ------Assignment-2----------------------------------------------------------------
  --Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
    select Empid,FullName from EmployeeD where mangid=986--------------1

  --Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.
    select project from EmployeeSal------------------------------------2

 -- Ques.3. Write an SQL query to fetch the count of employees working in project ‘P1’.
    select count(Emp_ID)'count' from EmployeeSal where project='p1'-------------------3

  --Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees.
    select max(sal)'max',min(sal)'min',AVG(sal) 'avg'from EmployeeSal--------4

  --Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
    select * FROM EmployeeSal
    where sal between 9000 and 15000-------------------------------------------5

 --Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
   select * from EmployeeD
   where mangid=321 and city='Toronto'------------------------------------------6

 -- Ques.7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
    select FullName,mangid,city from EmployeeD
    where mangid=321 or city='California'------------------------------------------7

  --Ques.8. Write an SQL query to fetch all those employees who work on Projects other than P1.
   select Emp_ID,project FROM EmployeeSal
   where project <>'p1'---------------------------------------------------8

   --Ques.9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
     select *, sal+variable 'Total salary' from EmployeeSal---------------9

 --Ques.10. Write an SQL query to fetch the employees whose name begins with any two characters,
	--followed by a text “hn” and ends with any sequence of characters.
    select Empid from EmployeeD
    union  
    select Emp_ID from EmployeeSal-------------------------------------10

	---------------Assignment-3-------------------------------------------------------------

--Ques.1 Write an SQL query to fetch all the EmpIds which are present in either of the tables –
--‘EmployeeDetails’ and ‘EmployeeSalary’.

	select EmployeeD.Empid from EmployeeD
	union 
	select EmployeeSal.Emp_ID from EmployeeSal

  --Ques.2 Write an SQL query to fetch common records between two tables.

	select EmployeeD.Empid,EmployeeD.FullName,EmployeeD.DateOfJoining,EmployeeD.mangid,EmployeeD.city,EmployeeSal.project,
	EmployeeSal.sal,EmployeeSal.variable from EmployeeD
	inner join EmployeeSal
	on EmployeeD.Empid=EmployeeSal.Emp_ID

--Ques.3. Write an SQL query to fetch records that are present in one table but not in another table.
	select EmployeeD.Empid,EmployeeD.FullName,EmployeeD.DateOfJoining,EmployeeD.mangid,EmployeeD.city,EmployeeSal.project,
	EmployeeSal.sal,EmployeeSal.variable from EmployeeD
	full join EmployeeSal
	on EmployeeD.Empid=EmployeeSal.Emp_ID

--Ques.4. Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary.
	select EmployeeD.Empid from EmployeeD
	union all
	select EmployeeSal.Emp_ID from EmployeeSal

--Ques.5. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary

	select EmployeeD.Empid from EmployeeD
	except
	select EmployeeSal.Emp_ID from EmployeeSal

--Ques.6. Write an SQL query to fetch the employee’s full names and replace the space
 select *,CHARINDEX(' ',FullName,1) from EmployeeD
 select *,left(FullName,CHARINDEX(' ',FullName,1)-1)'First Name' from EmployeeD
 select len(FullName) from EmployeeD
 select RIGHT(FullName,len(FullName)-CHARINDEX(' ',FullName,1))'Last Name' from EmployeeD

 select*,left(FullName,CHARINDEX(' ',FullName,1)-1)+RIGHT(FullName,len(FullName)-CHARINDEX(' ',FullName,1))'First&LastName'
 from EmployeeD

 --Ques.7. Write an SQL query to fetch the position of a given character(s) in a field.
 select CHARINDEX('s',FullName,1) 'position of S'from EmployeeD

 --Ques.8. Write an SQL query to display both the EmpId and ManagerId together.
 select Empid,mangid,CONCAT(Empid,mangid)'ID' From EmployeeD

 --Ques.9. Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table.
 select *,CHARINDEX(' ',FullName,1) from EmployeeD
 select *,left(FullName,CHARINDEX(' ',FullName,1)-1)'First Name' from EmployeeD

 --Ques.10. Write an SQL query to uppercase the name of the employee and lowercase the city values.
 select *,UPPER(FullName)'Upper case',LOWER(city)'Upper' from EmployeeD

 --------------Assignment-4------------------------------------------

 --Ques.1. Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.
   select * from EmployeeD
  select * from EmployeeSal

  --Ques.2. Write an SQL query to update the employee names by removing leading and trailing spaces.
  select *, CHARINDEX(' ',FullName,1) 'space'from EmployeeD
  select*, LEFT(FullName,CHARINDEX(' ',FullName,1)-1)'first'from EmployeeD
  select RIGHT(FullName, LEFT(FullName)-CHARINDEX(' ',FullName,1)-1))'last' from EmployeeD
  select *, CONCAT( LEFT(FullName,CHARINDEX(' ',FullName,1)-1),RIGHT(FullName,left(FullName)-CHARINDEX(' ',FullName,1)))'firstlast' from EmployeeD

 -- Ques.3. Fetch all the employees who are not working on any project.
  select EmployeeD.Empid,EmployeeD.FullName,EmployeeD.mangid,EmployeeSal.project from EmployeeD
  left join EmployeeSal
  on EmployeeD.Empid=EmployeeSal.Emp_ID
  where EmployeeSal.project=NULL

 --Ques.4. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.
  select * from EmployeeSal
  where sal between 5000 and 10000

 --Ques.5. Write an SQL query to find the current date-time.
  select GETDATE()

 --Ques.6. Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.
   select * from EmployeeD
   where DateOfJoining='2020'

 --Ques.7. Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the 
 --EmployeeSalary table.
   select EmployeeD.Empid,EmployeeD.FullName,EmployeeD.mangid,EmployeeD.DateOfJoining, EmployeeSal.sal from EmployeeD
   left join EmployeeSal
   on EmployeeD.Empid=EmployeeSal.Emp_ID

--Ques.8. Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order.
  select project,COUNT(Emp_ID)'Total count'
  from EmployeeSal
  group by project
  order by 'Total count'desc

--Ques.9. Write a query to fetch employee names and salary records. Display the employee details 
--even if the salary record is not present for the employee.
  select EmployeeD.FullName,EmployeeSal.Emp_ID,EmployeeSal.sal from EmployeeD
  inner join EmployeeSal
  on EmployeeD.empid=EmployeeSal.Emp_ID


--Ques.10. Write an SQL query to join 3 tables.
Select * from EmployeeD
inner join EmployeeSal
on EmployeeD.empid=EmployeeSal.Emp_ID

--------------Advance Assignment---------------------------------------

create table EmployeeInfo(Emp_id int,FName varchar(max),LName varchar(max),Department varchar(max),project varchar(max),EAddress varchar(max),
DOB date,gender varchar(max))
Drop table EmployeeInfo
select * from EmployeeInfo

create table EmpPosition(E_id int,EmpPosition varchar(max),DateOfJoining date,Salary int)
select * from EmpPosition

--Q1)Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.
  select *,UPPER(FName)as 'EmpName' from EmployeeInfo

--Q2)Write a query to fetch the number of employees working in the department ‘HR’.
select * from EmployeeInfo
where Department ='HR'

--Q3)Write a query to get the current date.
select GETDATE()'Current Date'

--Q4)Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
select left(LName,4)'EmpLName' from EmployeeInfo

--Q5)Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.
SELECT SUBSTRING(EAddress, 1, CHARINDEX('(',EAddress)) FROM EmployeeInfo

--Q6)Write a query to create a new table that consists of data and structure copied from the other table.
SELECT * INTO NewTable FROM EmployeeInfo WHERE 1 = 0
select * from NewTable

--Q7)Write q query to find all the employees whose salary is between 50000 to 100000.
select * from EmpPosition 
where salary between 50000 and 100000

--Q8)Write a query to find the names of employees that begin with ‘S’
select * from EmployeeInfo
where FName LIKE 'S%'

--Q9)Write a query to fetch top N records.
SELECT TOP 5 * FROM EmpPosition ORDER BY Salary DESC

--Q10)Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. 
--The first name and the last name must be separated with space.
select *,CONCAT(FName,' ',LName)'FullName' from EmployeeInfo

--Q11. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender
select gender ,count(Emp_id)from EmployeeInfo
group by gender
having DOB between 02-05-1970 and 31-12-1975

--Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.
select * from EmployeeInfo
order by LName desc,
Department asc

--Q13. Write a query to fetch details of employees whose EmpLname ends with 
--an alphabet ‘A’ and contains five alphabets.
select * from EmployeeInfo
Where LName like'____a'

--Q14. Write a query to fetch details of all employees excluding the employees with first names,
--“Sanjay” and “Sonia” from the EmployeeInfo table.

select * from EmployeeInfo
where FName not in('Sanjay','Sonia')

--Q15. Write a query to fetch details of employees with the address as “DELHI(DEL)”.
select * from EmployeeInfo where EAddress='Delhi'

--Q16. Write a query to fetch all employees who also hold the managerial position.
select * from EmpPosition
where EmpPosition='Manager'

--Q17. Write a query to fetch the department-wise count of employees sorted by department’s count in 
--ascending order.
select  Department,COUNT(Emp_id)'Totalcount' from EmployeeInfo
group by Department
order by Totalcount

--Q18. Write a query to calculate the even and odd records from a table.
select salary ,
DENSE_RANK() over (order by salary desc)'grade' from EmpPosition
having mod(grade,2)=0

--Q19. Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.
SELECT * FROM EmployeeInfo E 
WHERE EXISTS 
(SELECT * FROM EmpPosition P WHERE E.Emp_id = P.E_id)


--Q20. Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.
select MIN(Salary)'Min Salary',MAX(Salary)'Max Salary' from EmpPosition

SELECT DISTINCT Salary FROM EmpPosition E1
WHERE 2 >= (SELECT COUNT(DISTINCT Salary)FROM EmpPosition E2
WHERE (E1.Salary >= E2.Salary) ORDER BY E1.Salary DESC

-----two maximum salaries
SELECT DISTINCT Salary FROM EmpPosition E1
WHERE 2 >= (SELECT COUNT(DISTINCT Salary) FROM EmpPosition E2
WHERE E1.Salary <= E2.Salary) ORDER BY E1.Salary DESC;

--Q21. Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
SELECT Salary
FROM EmpPosition E1
WHERE N-1 = (
SELECT COUNT( DISTINCT ( E2.Salary ) )
FROM EmpPosition E2
WHERE E2.Salary > E1.Salary )
------------------------------------or-----------------------------------------
WITH RESULT AS
(
SELECT *,ROW_NUMBER() OVER(ORDER BY Salary desc)'highsal' from EmpPosition
)

SELECT * FROM RESULT
WHERE RESULT.highsal=8

--Q22. Write a query to retrieve duplicate records from a table.
SELECT Emp_id, FName, Department COUNT(Emp_id) FROM EmployeeInfo
GROUP BY Emp_id, FName, Department ------------------------------------wrong
HAVING COUNT(Emp_id) > 1

--Q23. Write a query to retrieve the list of employees working in the same department.
Select DISTINCT E.Emp_id, E.FName, E.Department 
FROM EmployeeInfo E, Employee E1 
WHERE E.Department = E1.Department AND E.Emp_id != E1.E_id---wrong

--Q24. Write a query to retrieve the last 3 records from the EmployeeInfo table.
with Result as
(
select *,
DENSE_RANK()over (order by Emp_id desc)'rank'from EmployeeInfo
)
select * from Result
where Result.rank in (3,2,1)

--Q25. Write a query to find the third-highest salary from the EmpPosition table.
select top 1 Salary
(
select top 3 Salary from EmpPosition
Order by Salary desc
)
from EmpPosition

--Q26. Write a query to display the first and the last record from the EmployeeInfo table.
SELECT * FROM EmployeeInfo WHERE Emp_id = (SELECT MIN(Emp_id) FROM EmployeeInfo)-----first record
SELECT * FROM EmployeeInfo WHERE Emp_id = (SELECT Max(Emp_id) FROM EmployeeInfo)------Last record

--27. Write a query to add email validation to your database
 SELECT Email FROM EmployeeInfo WHERE NOT REGEXP_LIKE(Email, ‘[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}’, ‘i’)

 --Q28. Write a query to retrieve Departments who have less than 2 employees working in it.
 select Department,COUNT(Emp_id)'Count' from EmployeeInfo
 group by Department
 Having Count(Emp_id)<2

 --Q29. Write a query to retrieve EmpPostion along with total salaries paid for each of them

 select EmpPosition ,sum(Salary)'Total salary' from EmpPosition
 group by EmpPosition
 
 --Q30. Write a query to fetch 50% records from the EmployeeInfo table.
 SELECT * FROM EmployeeInfo WHERE
Emp_id<= (SELECT COUNT(Emp_id)/2 from EmployeeInfo)
--------------------OR------------------------------------------

select top 50 percent * from EmployeeInfo;













