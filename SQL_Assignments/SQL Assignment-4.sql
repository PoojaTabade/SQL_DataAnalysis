create table Student(StudentId int,name varchar(max),surname varchar(max),BirthD date,Gender varchar(max
select * from Student
delete Student
drop table Student
--Example 1:  List all the records in the student chart
create table Student(StudentId int,name varchar(max),surname varchar(max),BirDate date,Gender varchar(max),class varchar(max))
select * from Student---------------------------------------------------1

--Example 2: List the name surname and class of the student in the student table
select name,surname, class from Student---------------------------------2

--Example 3: List the gender Female (F) records in the student table
select * FROM Student
where Gender='F'--------------------------------------------------------3

--Example 4 : List the names of each class in the way of being seen once in the student table
select distinct class from Student---------------------------------------4

--Example 5: List the students with Female gender and the class 10Math in the student table
select * from Student
where Gender='F' AND Class='10math'---------------------------------------5

--Example 6: List the names, surnames and classes of the students in the class 10Math or 10Sci in the student table
select name,surname,class from Student 
where class in('10math','10sci')---------------------------------------------6

--Example 6: List the names, surnames and classes of the students in the class 10Math or 10Sci in the student table
select name,surname,StudentId AS 'Number' from Student---------------------------------------------7

--Example 8: List the students name and surname by combining them as name surname in the student table
select name+surname as 'Surname' from Student---------------------------------------------------8


--Example 9: List the students with the names starting with “A” letter in the student table
select * from Student
where name like 'A%'--------------------------------------------------------------------9

--Example 11: List the students with names Emma Sophia and Robert in the student table 
select * from Student
where name in('Pooja','Nutan')-----------------------------------------------------------11

--Example 12: List the students with names starting with A D and K in the student table
select * from Student
where name like '[ADK]%'--------------------------------------------------------------------12

--Example 13: List the names surnames classes and genders of males in 9Math or females in 9His in the student table
select name,surname,class,Gender from Student
where Gender='M' and class='10math'or
Gender='F' and class='10Sci'-----------------------------------------------------------------13

--Example 13: List the names surnames classes and genders of males in 9Math or females in 9His in the student table
select NAME, Gender,class from Student
where gender='M' AND CLASS IN('10MATH','10BIO')----------------------------------------------14

--Example 14: List the males whose classes are 10Math or 10Bio
select * from Student
where BirDate between '1/1/1989' and '31/12/1989' ----------------------------------------------15

--Example 15: List the students with birth year 1989 in the student table
select * from Student
where BirDate=1989


