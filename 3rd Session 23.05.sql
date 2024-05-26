--1. Permanent Tables => MyFirstTable , MySecondTable
--2. Derived Tables => SubQuery table => result will be from 1 or more tables
--3. Temp Tables => Temp tables will delete automatically when you're closing the session => store in the Tempdb 
--4. Table Variables => It will just store the value in memory temporarily
Select * from MyFirstTable 
Select * from MySecondTable

--Select * from MySecondTable 
--where -- is a clause
--ID 
--in -- is a condition
--(select ID from MyFirstTable)

--SElect * from (select * from MyFirstTable) as MyDerivedTables

--Delete from MySecondTable where ID = 3

--2 types of temp tables
--Global Temp Table 
--Local Temp Table

--For Local Temp table you've to create by using #
--For Global Temp table you have to use ##

--Global Temp table lifetime exists until closing the connection, when we close it will drop automatically
--You can access from any session until you close the connection

--For Local after session it will not work because scope is only for the particular session

--create table #TempTable1
--(
--ID int,
--Name nvarchar(50)
--)

--select * from #TempTable1


--create table ##TempTable2
--(
--ID int,
--Name nvarchar(50)
--)



--create table ##TempTable3
--(
--ID int,
--Name nvarchar(50)
--)

--select * from ##TempTable2

--Declare @TableVariable1 Table
--(
--ID int,
--Name nvarchar(50)
--)

--insert into @TableVariable1
--values ( 1, 'Raj')

--select * from @TableVariable1

--insert into MyFirstTable
--values (4, 'Hari', 23, 'Madurai', 'sh')

Declare @Pagenumber int -- It is nothing but declaring a variable 
set @Pagenumber = 4 -- We setting the variable value
--- LIMIT/OFFSET
select * from MyFirstTable
Order by ID
Offset 1 Rows -- how many you have to skip -> 0 rows
Fetch Next 2 Rows Only -- Limiting the pagination rows

--select * from #TempTable1
--insert into #TempTable1
--values(1,'Raj')
Select * from MyFirstTable
--drop table #TempTable1


--I want to add only ID which is greater than 3 
Select ID,Name into #TempTable1
From MyFirstTable
Where ID >=3

--Select * from MyFirstTable where Name Like '%m%'

--Exec sp_rename 'MyFirstTable.Name', 'FirstName', 'Column'

--ALter Table Tablename
--Column OldColumnName , NewColumnName