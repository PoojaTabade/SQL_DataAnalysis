---------Basic Question--------------------------------------------
---1)Create two Databases Name :- Brands , and  Products

create database Brands
create database Products
----------------------------------------------------------------------------------------------------------------------
---2) Create two tables in SQL Server  name  as ITEMS_Table in Brands database and PRODUCT_Table in Products database.

create table Item(id int not null,itemD varchar(max),venderNo int,VenderName varchar(max),bottoleSize int,BottlePrice varchar(max))
select * from Item

create table Product1(Product_id int,Country varchar(max),Product varchar(max),Unitsold int,ManufactureP varchar(max),salePrice varchar(max),GrossSale varchar(max),Sales varchar(max),
COGS varchar(max),Profit varchar(max),PDate date,PMonthNo int,PMonthName varchar(max),Yeara int)
select * from Product1
-----------------------------------------------------------------------------------------------------------------------
3) ------ After Creating both the tables Add records in that tables (records are available above)

  select * from Item
  select * from Product1                    
-----------------------------------------------------------------------------------------------------------------------
--4) Delete those product having the Units Sold 1618.5 , 888 and 2470.
 delete Product1
 where Unitsold in(1618.5 , 888,2470)

--5) DROP the table and Create it again.
drop table Product1
create table Product1(Product_id int,Country varchar(max),Product varchar(max),Unitsold float,ManufactureP varchar(max),salePrice varchar(max),GrossSale varchar(max),Sales varchar(max),
COGS varchar(max),Profit varchar(max),PDate date,PMonthNo int,PMonthName varchar(max),Yeara int)

select * from Product1                   
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------BIG Table-------------------------
select * from Product1                   
--1) Find the Total Sale Price  and  Gross Sales 
alter table Product1 alter column salePrice money
alter table Product1 alter column GrossSale money

select sum(salePrice)'TotalSaleprice',sum(GrossSale)'TotalGross sale' from Product1
--------------------------------------------------------------------------------------------
--2) In which year we have got the highest sales
select yeara,max(Sales)'Max sale' from Product1
group by yeara
order by [Max sale]desc
--------------------------------------------------------------------------------------
--3)  Which Product having the sales of $ 37,050.00
select Product from Product1
where Sales= $ 37050.00
-----------------------------------------------------------------------------------
--4) Which Countries lies between profit of $ 4,605 to $  22 , 662.00
select Country from Product1
where Profit between $ 4605 and $  22662.00
--------------------------------------------------------------------------------------
--5) Which Product Id having the sales of $ 24 , 700.00
select Product_id from Product1
where Sales=$ 24700.00

-------------------------------------Small Table-------------------------------------------------
---1) Find the item_description having the bottle size of 750
select * from Item
where bottoleSize=750
-----------------------------------------------------------------------------------------------------
--2) Find the vendor Name having the vendor_nos 305 , 380 , 391
select id,VenderName,venderNo from Item
where venderNo in(305,380,391)
------------------------------------------------------------------------------------------------------
--3) What is total Bottle_price 
alter table Item alter column BottlePrice money
select sum(BottlePrice) 'TotalBottle Price'from Item
---------------------------------------------------------------------------------------------
--4) Make Primary Key to Item_id
alter table Item alter column id int not null
alter table Item add Primary key(id)

--5) Which item id having the bottle_price of $ 5.06
select * from Item
where BottlePrice=5.06
-----------------------------------------------------------------------------------------------
------------------------------Advance Questions-----------------------------------
--1) Apply INNER  , FULL OUTER , LEFT JOIN types on both the table 
select * from [Brands].dbo.Item
inner join [Products].dbo.Product1
on [Brands].dbo.Item.id=[Products].dbo.Product1.Product_id


select * from [Brands].dbo.Item
full outer join [Products].dbo.Product1
on [Brands].dbo.Item.id=[Products].dbo.Product1.Product_id

select * from [Brands].dbo.Item
left join [Products].dbo.Product1
on [Brands].dbo.Item.id=[Products].dbo.Product1.Product_id

--2) Apply  OUTER  ,  RIGHT JOIN , CROSS JOIN types  on both the table 
select [Brands].dbo.Item.itemD,[Brands].dbo.Item.id , [Products].dbo.Product1.Product ,[Products].dbo.Product1.GrossSale
from [Brands].dbo.Item
right join [Products].dbo.Product1
on [Brands].dbo.Item.id=[Products].dbo.Product1.Product_id

select [Brands].dbo.Item.itemD,[Brands].dbo.Item.id , [Products].dbo.Product1.Product ,[Products].dbo.Product1.GrossSale
from [Brands].dbo.Item
outer join [Products].dbo.Product1
on [Brands].dbo.Item.id=[Products].dbo.Product1.Product_id

select [Brands].dbo.Item.itemD,[Brands].dbo.Item.id , [Products].dbo.Product1.Product ,[Products].dbo.Product1.GrossSale
from [Brands].dbo.Item
cross join [Products].dbo.Product1
-----------------------------------------------------------------------------------------
--3) Find the item_description and Product having the gross sales of 13,320.00

select [Brands].dbo.Item.itemD,[Brands].dbo.Item.id , [Products].dbo.Product1.Product ,[Products].dbo.Product1.GrossSale
from [Brands].dbo.Item
right join [Products].dbo.Product1
on [Brands].dbo.Item.id=[Products].dbo.Product1.Product_id
where [Products].dbo.Product1.GrossSale=13320.00

--4)   Split the Item_description Column into Columns Item_desc1 and Item_desc2
  select CHARINDEX(' ',ItemD,1)FROM Item
  select *, left(ItemD,CHARINDEX(' ',ItemD,1)-1)'Item_desc1'FROM Item
  select *, RIGHT(ItemD,left(ItemD,1)-CHARINDEX(' ',ItemD,1))'Item_des2'FROM Item