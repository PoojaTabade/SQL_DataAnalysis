create table EventD(EveID int,Duration int,Status_code varchar (max),Reason_code varchar(max))
create table StatusD(Stat_cod varchar(max),NAME varchar(max))
create table ReadyR(RCode varchar(max),name varchar(max))
create table DelayR(Rcod varchar(max),Name varchar(max))
create table DownR(RCODE varchar(max),Name varchar(max))
create table Spare(RCODE varchar(max),Name varchar(max))

select * from EventD
select * from StatusD
select * from ReadyR
select * from DelayR
select * from DownR
select * from Spare

select EventD.EveID,EventD.Duration,EventD.Status_code,StatusD.Rea_cod from EventD 
inner join StatusD
on EventD.Status_code=StatusD.Stat_cod


select ReadyR.RCode,name from ReadyR
union 
select DelayR.Rcod, Name from DelayR
union 
select Spare.RCODE,Name from Spare
union 
select DownR.RCODE,Name from DownR


select EventD.EveID,EventD.Duration,EventD.Status_code,StatusD.Name from EventD 
inner join 
(
select ReadyR.RCode,name from ReadyR
union 
select DelayR.Rcod, Name from DelayR
union 
select Spare.RCODE,Name from Spare
union 
select DownR.RCODE,Name from DownR
)StatusD
on EventD.Status_code=StatusD.Name
AND EventD.Reason_code=StatusD.RCode