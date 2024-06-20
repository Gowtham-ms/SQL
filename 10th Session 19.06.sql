--Cursor : Retrive, manipulate and navigate through a set of result one by one (row by row)

--select * from Employees

-- cursor : Looping the tables

--update Employees
--set Salary = '50000'
--where EmployeeID = @EmployeeID

select * from Employees


--exec SP_Cursors
--ALTER procedure SP_Cursors
--As
--Begin
--Declare @Salary int 
--Declare @rowcount int = 0 --> initializing the row 
--Declare @EmployeeID int
--Declare employee_cursor Cursor
--For Select EmployeeID,(Salary+1) from Employees ----> Select 
--Open employee_cursor --> open statement initialize the cursor and populates the result set from the above select statement
--Fetch Next from employee_Cursor --- 1 st row --> retreives the next next row 
--into @EmployeeID,@Salary --> Save the 1st row values for first loop 1 2 3 4 5 6 
--While @@FETCH_STATUS = 0 and @RowCount <4 ---> it will check whether there is next row or not (next rows to fetch or not)
--BEGIN ---> Begining the logic

--update Employees
--set Salary = @Salary
--where EmployeeID = @EmployeeID

--set @rowcount = @rowcount + 1

--Fetch Next From employee_Cursor into @EmployeeID,@Salary
--End --> End the logic
--Close employee_cursor
--Deallocate employee_cursor
--END


--Error handling in SP
--> TRY & Catch

--BEGIN TRY
----- SQL Statements that might cause an error
--select * from Employees
--END TRY
--BEGIN CATCH
----- Error handling code , Retrieve error
--Declare @ErrorMessage nvarchar(4000), @ErrorSeverity INT, @ErrorState Int, @ErrorLine Int
--select @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE(), @ErrorLine = ERROR_LINE()
--Print 'Error Occured in'+@ErrorLine+'the message is :' +@ErrorMessage

--End Catch


SElect * from Employees

--EXEC UpdateEmployeeSalary '7','10000'
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
		Declare @ErrorMessage nvarchar(4000), @ErrorSeverity INT, @ErrorState Int, @ErrorLine Int
		select @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE(), @ErrorLine = ERROR_LINE()
		Print 'Error Occured :' +@ErrorMessage
		--RAISERROR(@ErrorMessage,@ErrorSeverity,@ErrorState) -- optional
	End Catch
END


--0-10 : INformation message or warnings --> information message
--11-16 : Errors that can be corrected by ther user input --> by users
--17-19 : Software errors it will be handled by databse admins  --> Db admins
--20-25 : the logic has be terminated abnormally -- resolved by developers