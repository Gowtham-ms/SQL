--SQL Subqueries
--is a query within another query

select * from Employee

select * from Author
select * from Book

--insert into Author
--values ('Someone',7)

--insert into Book
--values('Someone wrote this book','Crime')
-- How many books written by the authors

--Using subqueries in SELECT
Select 
AuthorName,
(Select count(*) from Author where AuthorName = A.AuthorName) as BookCount
From 
Author A
Group By
AuthorName

-- Count is used to count the number of rows 

-- Using Subqueries in From

--Create Table Employees
--(
--EmployeeID int identity(1,1) primary key,
--EmployeeName nvarchar(60),
--Salary int
--)

--Create Table Department
--(
--ID int identity(1,1) primary key,
--DepartmentName nvarchar(50)
--)

--insert into Employees
--values('Employee1', '45000')

--insert into Employees
--values('Employee1', '45000')

--insert into Employees
--values('Employee2', '65000')

--insert into Employees
--values('Employee3', '35000')

--insert into Employees
--values('Employee4', '40000')

--insert into Employees
--values('Employee5', '50000')

select * from Employees
select * from department
--insert into Department
--values('IT')
--insert into Department
--values('IT')
--insert into Department
--values('Stores')
--insert into Department
--values('Stores')
--insert into Department
--values('HR')

--I want to get Employee Salaries, department name and the average salary per department

Select 
E.Salary, 
D.DepartmentName, 
Avg(E.Salary) as AverageSalary
from Employees E
join Department D
on E.EmployeeID = D.EmployeeID
Group by DepartmentName, Salary
-- Average of any values you can write a subquery
Select 
DepartmentName,
Avg(Salary) as AverageSalary
from 
--TableName
(Select 
ID, 
DepartmentName,
Salary 
from Employees E 
Join Department D 
on E.EmployeeID = D.ID)
AS MyTableName
Group by -- is used to remove the duplicates rows of a column in a table 
DepartmentName

-- I want to get the employees who are all in the stores

Select EmployeeName,DepartmentName from Employees E
join Department D
on E.EmployeeID = D.ID
where D.DepartmentName = 'HR'

--Dept Name is a variable
Declare @DeptName nvarchar(50) = 'Stores' -- This value is coming from your application
Select *, @DeptName as DeptName
from
Employees 
where 
EmployeeID in (
select EmployeeID from Department where DepartmentName = @DeptName 
)

--select * from Employees where EmployeeID in (3,4)

--select 
--'Employee1' as EmpName, 
--'Department1' as DepartmentName,
--EmployeeID
--from Employees

--Subqueries in Having clause

--Having is group based on aggregate values
--From , Select , Where and having we can write a sub queries 