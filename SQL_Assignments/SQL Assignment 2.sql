-----------------Assignment-2---------------------------------

--Q1) Create   Database Name as Order_Stores_Data 
create database Order_Stores_Data
-------------------------------------------------------------------------------------------------------
--Q2) Create two Table names as Orders_Table and Stores_Table
---creating table Orders_Table
create table Orders_Table(OrderDate date,Region varchar (max),Rep varchar(max),Order_Item  varchar(max),Units int,UnitCost float,
TotalPrice float,Order_id int NOT NULL )


---creating Stores_Table
create table Stores_Table(Store_id int,StoreType varchar(max),Assortment int,CompetitionD int,amonth int,
aYear int,Promointerval varchar(max) )
----------------------------------------------------------------------------------------------------------------------

--Q3) Insert All records present here in the Orders_table and Stores_Table.
select * from Orders_Table
select * from Stores_Table
-------------------------------------------------------------------------------------------------------------------
--Q4) Make Order_Id  Column as Primary Key.
alter table Orders_Table add primary key (Order_id)
-----------------------------------------------------------------------------------------------------------------
--Q5) Add one Column Name  as Store_Names and insert the records given above in Stores table.
alter table Stores_Table add  StoreName varchar(max)

update Stores_Table set StoreName='Car' where Store_id=1
update Stores_Table set StoreName='Bikes' where Store_id=2
update Stores_Table set StoreName='Hardware' where Store_id=3
update Stores_Table set StoreName='Electrics' where Store_id=4
update Stores_Table set StoreName='Fibers' where Store_id=5
update Stores_Table set StoreName='Elastics' where Store_id=6
update Stores_Table set StoreName='Books' where Store_id=7
update Stores_Table set StoreName='Shoes' where Store_id=8
update Stores_Table set StoreName='Clothes' where Store_id=9
update Stores_Table set StoreName='Scraps' where Store_id=10
-------------------------------------------------------------------------------------------------------------------
--Q6) Make Stored_Id as a Foreign Key with reference too Orders_Table 
alter table Stores_Table add  foreign key (Store_id) references Orders_Table(Order_id)
----------------------------------------------------------------------------------------------------------------------
--Q7) Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet
update Orders_Table set Order_Item='Compass'
where Order_id=3

update Orders_Table set Order_Item='Torch'
where Order_id=4

update Orders_Table set Order_Item='Phone'
where Order_id=5

update Orders_Table set Order_Item='Laptop'
where Order_id=7

update Orders_Table set Order_Item='Box'
where Order_id=9

select * from Orders_Table
------------------------------------------------------------------------------------------------------------------
--Q8) Update the missing records in the PromoInterval Column in Stores Table.
update Stores_Table set Promointerval='Apr'
where Store_id=4


update Stores_Table set Promointerval='Jul'
where Store_id=7

update Stores_Table set Promointerval='Sep'
where Store_id=9

select * from Stores_Table
-------------------------------------------------------------------------------------------------------------
--Q9) Rename the column name  of Assortment to Store_Nos in Stores_Table.

Exec sp_rename 'Stores_Table.aSSORTMENT', 'Store_nos'
select * from stores_table
------------------------------------------------------------------------------------------------------------------
--Q10) Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table.
exec sp_rename 'Orders_Table.Order_Item','Item_name'
exec sp_rename 'Orders_Table.Rep','Customers_name'
select * from Orders_Table
---------------------------------------------------------------------------------------------------------------------

--Q11) Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.
Select * from Orders_table 
order by UnitCost desc

Select * from Orders_table 
order by TotalPrice asc
--------------------------------------------------------------------------------------------------------------------------
--Q12) Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.
exec sp_rename 'Orders_Table.Customers_name','Cus_Name'

select Region,count(Cus_Name)'Total customer' from Orders_Table
group by Region
----------------------------------------------------------------------------------------------------------------------------

--Q13) Find the sum of Total_Price Column and Unit Cost  in Orders_Table 
select sum(TotalPrice)'TOtal_price',sum(UnitCost)'Total Unit' from Orders_Table
--------------------------------------------------------------------------------------------------------------------------------
--Q14) Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names that table as Order_Stores_Table.

select o.OrderDate,o.UnitCost,s.StoreType,s.aYear  from Orders_Table as o-------------------------
inner join Stores_Table as s
on o.Order_id=s.Store_id

---------------------------------------------------------------------------------------------------------------------------------------
--Q15)  Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9
select Order_id,Item_name,Region from Orders_Table
where Order_id in(4,5,6,9)


--Q16) Show me year  whose ComptetitionDistance is 29910  , 310 , 3160
select aYear from Stores_Table
where CompetitionD in(29910  , 310 , 3160)

--Q17)  Give me that Item_name whose  Total_Price is greater than 200 and less than 400
select * from Orders_Table
where TotalPrice >200 and TotalPrice< 400
--------------------------------------------------------------------------------------------------------
--Q18) Rename the CompetitionDistance as CD and find the total CD in Stores_Table.
exec sp_rename 'Stores_Table.CompetitionD','CD'
select * from Stores_Table

----------------------------------------------------------------------------------------------------------
--Q19) What is the Total Count of Stores_Type and CD columns
SELECT COUNT(StoreType)'Total StoreType',count(CompetitionD)'CD' from Stores_Table
-------------------------------------------------------------------------------------------------
--Q20) Apply the Cross Join in  Orders_Table and Stores_Table
select * from Orders_Table 
cross join Stores_Table
------------------------------------------------------------------------------------------------------------
--Q21 DROP both the databases
drop database Order_Stores_Data