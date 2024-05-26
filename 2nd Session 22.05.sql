--Data Manipulation Language (DML)
--   - Inserting data (INSERT)
--   - Updating data (UPDATE)
--   - Deleting data (DELETE)
--   - Retrieving data (SELECT)

--Understand the problem first , you can easily find the solution

SELECT * FROM MyFirstTable

--UPDATE MyFirstTable
--SET Address = '75 , Chennai, Tamilnadu'
--where id = 2

--Update MyFirstTable
--set Age = 'My age is 35'
--where Id = 2

--Insert into MyFirstTable
--Values(1, 'Kumar', 34, 'Chennai',null)


--Insert into MyFirstTable
--Values(2, 'Raj', 35, 'Chennai',null)


--Insert into MyFirstTable
--Values(3, 'Hari', 28, 'Chennai',null)


--Insert into MyFirstTable
--Values(4, 'Kumaresh', 20, 'Chennai',null)

--DELETE FROM MyFirstTable where Name = 'Kumaresh'

--Data Definition Language (DDL)
--   - Creating databases and tables
--   - Data types
--   - Modifying tables (ALTER) (Renaming)
--   - Dropping tables

select * from MyFirstTable

--ALTER TABLE MyFirstTable
--ADD LastName nvarchar(50)

--ALTER TABLE MyFirstTable
--DROP COLUMN DOB

--IF you DELETE the TABLE it will delete only the rows inside the table
-- drop the whole table
--DROP Table MyFirstTable
--TRUNCATE

--Delete from MyFirstTable

--select * from MyFirstTable
--select * from MySecondTable


--Truncate table myfirsttable --where ID = 3

--Delete from MySecondTable where Id = 3


--Insert into MySecondTable
--Values( 'Kumar', 'Chennai')--6 


--Insert into MySecondTable
--Values( 'Raj', 'Chennai') --7 


--Insert into MySecondTable
--Values( 'Hari', 'Chennai') -- 8


--Truncate table MySecondTable


--CREATE Table MySecondTable
--(
--ID int primary key identity(1,100),
--Name nvarchar(40),
--Address nvarchar(100)
--)