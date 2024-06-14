--Having Clause
--Is used to filter group of rows returned by the group by clause

Select * from Employee

--insert into Employee
--values('Team Member 2',1)

select FirstName, ManagerID from Employee
group by FirstName, ManagerID

--Aggregate Functions - Sum(), Count(), Avg(), Max() & Min()

--Create table Sales
--(
--SaleID int identity(1,1) primary key,
--ProductID int,
--Quantity int,
--SalesDate Datetime
--)

--insert into Sales
--values (1004,5, getdate())

--select * from sales
--I want a ProductID , Sum of the quantity . I want to get sum of quantity which is greater than 30

--select * from sales
--select ProductID, Sum(Quantity) TotalQuantity from Sales
----where Quantity > 30
--Group By ProductID
--Having Sum(Quantity) > 30

select * from Department

--I want to select the department with more employees than the average number of employees per department
-- Sub queries in Having clause
Select DepartmentName,Count(*) as EmployeeCount
from Department
Group By DepartmentName
Having count(*) >=(
select Avg(EmployeeCount) from (select DepartmentName,Count(*) As EmployeeCount from Department group by DepartmentName) as Dept
)

-- Max and Min
select * from sales

select ProductID,Min(Quantity) from Sales
group by ProductID


--- Union & Union All
--Both Union & Union all is used to combine the results of two or more select queries

--Union : Combine the results of two or more select queries and removes duplicates. Equal number of columns you need to add in both the queries

--Union All : Combine the results of two or more select queries and it will not remove duplicates. Equal number of columns you need to add in both the queries



--Create table Sales2024
--(
--SaleID int identity(1,1) primary key,
--ProductID int,
--Quantity int,
--SalesDate Datetime
--)


select * from sales -- 2023
select * from sales2024
-- I want to get the quantity of the product in both 2023 & 2024 table

--Union Query
select ProductID, Quantity from Sales -- 2023
union all
select ProductID, Quantity from Sales2024


--String Functions - CONCAT

--select * from Employee1

--create table Employee1
--(
--Firstname nvarchar(50),
--LastName nvarchar(50)
--)

--insert into Employee1
--values ( 'MS', 'Gowtham')

--Select Concat(Firstname,'.,',LastName) Name from Employee1

--I want to get Length of a string

--Password field in a application -> 8 characters 
--gowtham - 7 characters
--select Len(LastName)as password from Employee1
select * from Employee1

--MSHAM

select Substring(Lastname,1,3) from Employee1


--Gowtham
--1234567
--selvaraj
--12345678

select SUBSTRING(LastName,len(lastname)-2,3) Last3Char from Employee1

select len(lastname) from Employee1

--insert into Employee1
--values('MS','Selvaraj')