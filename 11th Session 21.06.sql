--Create Table ErrorLog
--(
--ErrorLogID int identity(1,1) primary key,
--ErrorMessage nvarchar(4000),
--ErrorSeverity Int,
--ErrorState int,
--ErrorProcedure nvarchar(2000),
--ErrorLine int,
--ErrorTime datetime default getdate()
--)
select * from ErrorLog

Exec UpdateEmployeeSalary '8','10000'
ALTER Procedure UpdateEmployeeSalary  
@EmployeeID int,  
@NewSalary int  
As  
BEGIN  
 BEGIN TRY  
  --- SQL Statements that might cause an error  
  -- update the salary of a particular employee  
  Update Employees  
  Set Salary = @NewSalary  
  where EmployeeID = @EmployeeID  
  --- check if the update was successful  
  If @@ROWCOUNT = 0 --- Built in global variable to get the number of rows affected  
   Begin  
    --- If no rows were affected raise an error  
    RAISERROR('The Given EmployeeID is not available',25,1);  
   END  
 END TRY  
 BEGIN CATCH  
  --- Error handling code , Retrieve error  
  Declare @ErrorMessage nvarchar(4000), @ErrorSeverity INT, @ErrorState Int, @ErrorLine Int  , @ErrorProcedure nvarchar(1000)
  select @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE(), @ErrorLine = ERROR_LINE()  ,@ErrorProcedure = Error_Procedure()
  EXEC ErrorLogProcedure @ErrorMessage,@ErrorSeverity,@ErrorState,@ErrorLine,@ErrorProcedure
  --insert into ErrorLog(ErrorMessage,ErrorSeverity,ErrorState,ErrorProcedure,ErrorLine) values (@ErrorMessage,@ErrorSeverity,@ErrorState,Error_Procedure(),@ErrorLine)
  Print 'Error Occured :' +@ErrorMessage  
  --RAISERROR(@ErrorMessage,@ErrorSeverity,@ErrorState) -- optional  
 End Catch  
END  

aLTER Procedure ErrorLogProcedure
(@ErrorMessage nvarchar(4000), @ErrorSeverity INT, @ErrorState Int, @ErrorLine Int,@ErrorProcedure nvarchar(1000) )
As
BEgin
 insert into ErrorLog(ErrorMessage,ErrorSeverity,ErrorState,ErrorProcedure,ErrorLine) values (@ErrorMessage,@ErrorSeverity,@ErrorState,@ErrorProcedure,@ErrorLine)
End


--TRIGGERS
--special type of stored procedure that automatically execute or fire when certain events occur on a table or views
--1. AFTER Triggers : after an insert , update or delete operation on a table

--Create Table EmployeeLog(
--LogID int identity(1,1) primary key,
--EmployeeID int,
--[Action] nvarchar(50),
--ActionTime datetime default getdate()
--)


select * from Employees
select * from EmployeeLog

--Create Trigger trgAfterInsertEmployee
--on Employees
--After Insert
--As
--Begin
--Insert into EmployeeLog(EmployeeID,[Action]) Select EmployeeID,'Insert' from inserted
--End



--insert into Employees values('Employee7',100000)

--2. INSTEAD of Triggers
--Instead of insert : 
--instead of update 
--instead of delete 

-- 3. Before Triggers 
-- Before Insert 
--Before Update 
--Before Delete

ALTER Trigger trgInsteadOfInsertEmployee
on Employees
Instead of insert 
As
Begin
Insert into EmployeeLog (EmployeeID,Action) Select EmployeeID,'Insert Attempt' from inserted

insert into Employees(EmployeeName,Salary) select EmployeeName,Salary from inserted where salary > 1000

delete from employees where employeerole in(select employeerole from deleted where employeerole = 'admin')
END

select * from Employees
select * from employeeLog

insert into Employees 
values ('Employee9',1001)