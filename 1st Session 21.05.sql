--CREATE DATABASE MyFirstDB
--USE MyFirstDB
--Table : Structured way of storing information by rows and columns

--CREATE TABLE MyFirstTable
--(
--ID int,
--[Name] nvarchar(50),
--Age int,
--Address nvarchar(100),
--DOB DateTime
--)

--(*) all the columns and all the rows of a table
--SELECT * FROM MyFirstTable

-- Give some information into the particular table for the particular column
-- Any string values in SQL should be inside the single Quotes

--INSERT INTO MYFirstTable 
--(ID,Name,Age,Address,DOB) VALUES
--(1, 'Raj', 25, 'Chennai', GETDATE()) 

SELECT * FROM MyFirstTable

--STRUCTURED QUERY LANGUAGE


--INSERT INTO MYFirstTable 
--(ID,Name,Age,Address) VALUES
--(2, 'Kumar', 30, '75') 

--NULL & NOT NULL


SELECT * FROM MyFirstTable WHERE ADDRESS='Chennai'

--CREATE Table with 5 columns and all columns should use  int, nvarchar, datetime datatypes and I want you to insert 10 rows in that table and I want you to use where condition to get 5,7,9,10,1