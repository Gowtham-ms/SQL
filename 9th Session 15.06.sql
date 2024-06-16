--Stored Procedures & Functions
--Stored Procedures :
--Set of sql queries/statements with a name which can be executed with a simple call
-- Whenever you want to do any operations in SQL using ur web applications/desktop you've to create procedure

ALTER Procedure GetEmployeeDetails
@EmployeeID int, --- Input parameter (1) 1sst parameter
@DepartmentName nvarchar(10) --- 2nd parameter
As
Begin
Select dbo.GetEmployeeFullName('Gowtham') EmployeeName, * from Employees where EmployeeID = @EmployeeID
select * from Department where DepartmentName = @DepartmentName
END

Exec GetEmployeeDetails '1','IT'
--Functions : 
--kind of stored procedures but are designed to return a single value or a table . They can also used within sql statements like queries

--Create Function Function_Name
--(
--@param1 int, --- Input parameter 
--@param2 nvarchar(10)
--)
--Returns varchar(10) --- you need to declare what it is going to return Datatype 
--As
--Begin
---- SQL statements
--Return return_value
--End


ALTER Function GetEmployeeFullName
(
@Name nvarchar(100)
)
Returns nvarchar(100)
As
Begin

Declare @FullName nvarchar(100) -- Variable Name

select @FullName = FirstName +' '+ LastName from Employee1 where LastName = @Name

Return @FullName
End


--Stored Procedure :
--Zero, one or more tables || you cannot use stored procedures inside a sql statement || have input parameter as well as output parameter || EXEC || Inser, Update, Delete any operations in sp
-- Faster
--Function :
--Return a single value or table || it can be used in select and where etc || input parameter and no output parameter || Select Statements || Select queries
-- Slower

--ALTER Procedure CalculatingSales
--@EmployeeID int,
--@TotalSales int  Output
--As
--Begin
--select @TotalSales = Sum(5+5) --from sometable where employeeid = @EmployeeID
--End

--declare @TotalSales int
--Exec CalculatingSales '1',@TotalSales = @TotalSales output
--select @TotalSales as Total