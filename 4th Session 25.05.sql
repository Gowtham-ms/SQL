--Key concepts of sql
--Primary key , Foreign Key and Unique Key

--Primary Key
--You have to set atleast one unique column in your table 

--Create Table MyFirstPKTable
--(
--ID int primary key,
--State nvarchar(50),
--CreatedDate datetime
--)
--select * from myfirstpktable
--Insert into MyFirstPKTable
--values (1,'Uttar Pradesh',getdate())
--Insert into MyFirstPKTable
--values (1,'Tamil Nadu', getdate()) -- You can not insert duplicates
--Insert into MyFirstPKTable
--values (null, 'Andhra Pradesh', getdate()) -- You can not insert null 
--Insert into MyFirstPKTable
--values (4,null,getdate())
--Insert into MyFirstPKTable
--values (6,null,getdate())

--Create Table MySecondPKTable
--(
--ID int primary key,
--State nvarchar(50) primary key,
--CreatedDate datetime
--) -- You can not create more than one primary key in your table 

---- Unique Key
--Create Table MySecondPKUKTable
--(
--ID int primary key,
--State nvarchar(50) Unique,
--CreatedDate datetime
--) -- You can create more than 1 unique key to your table
--Insert into MySecondPKUKTable
--values (1, 'TamilNadu', getdate())
--select * from MySecondPKUKTable
--Insert into MySecondPKUKTable
--values (2, 'TamilNadu', getdate()) -- You can not create duplicate values to unique key columns
--Insert into MySecondPKUKTable
--values (3, null, getdate()) -- Unique key allows null but PK will not
--Insert into MySecondPKUKTable
--values (4, null, getdate()) -- Only one null values to unique key column

--Create Table MyThirdUK
--(
--ID int primary key ,
--State nvarchar(50) unique,
--CreatedDate datetime unique
--) -- You can add more than 1 unique key columns to your table

----Foreign Key
--Create Table MyFirstFKTable
--(
--ID int primary key,
--City nvarchar(50) not null,
--StateID int -- it should link with your state table (that is MyFirstPKTable)
--Foreign Key (StateID) References MyFirstPKTable
--Foreign Key (City) references MyFirstPKTable
--) -- You can more than 1 FK to your table


--select * from myfirstpktable
--Insert into MyFirstFKTable
--values (1, 'Chennai', 2)

--select * from myfirstpktable
--select * from MyFirstFKTable
--Insert into MyFirstFktable
--values (2, 'Madurai', 2) -- FK Allows duplicates

--insert into MyFirstFkTable
--values(3,'Trichy',null) -- FK allows null

--insert into MyFirstFkTable
--values(4,'Coimbatore',null) -- FK Allows more than one null values 

--insert into MyFirstFKTable
--values(5, null, 3)

--Candidate Key
--which is nothing but combination of primary and unique key
-- One candidate key is selected as the PK
--Create Table MyFirstCK(
--ID int ,
--Products nvarchar(50),
--UserName nvarchar(50)
--Primary key (ID),
--Unique (Products)
--)

--Composite Key

--Create Table MyFirstCompKey(
--OrderID int,
--ProductID int,
--Quantity int
--Primary Key (OrderID, ProductID) -- Composite key
--)


--Insert into MyFirstCompKey
--values(1, 1, 5)
--Insert into MyFirstCompKey
--values(1, 2, 6)
--Insert into MyFirstCompKey
--values(2, 2, 6)
--Insert into MyFirstCompKey
--values(2, 2, 7)
--Insert into MyFirstCompKey
--values(2, null, 7)
--Consists of multiple columns and together it should be unique record and whenever a single column is insufficient for unique identification