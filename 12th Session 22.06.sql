----TRANSACTIONS
----A sequence of one or more sql operations executed as a single unit.

----Create Procedure BankingAccount
----(
----)
----As 
----Begin
----Create An account (Inserting)
----Update an account holder's money (Updating)
----delete an account holder  (Deleting)
----View the balance account (Select)
----End


----Transaction control -> Begin , Commit & Rollback
----Begin -> It is starting a transaction
----Commit -> It will save the changes 
----Rollback -> Reverting the saved changes

----transfer 100 rs from account a to account b

----Create Table Accounts
----(
----AccountID int primary key identity(1,1),
----AccountHolderName nvarchar(100) not null,
----Balance decimal(10,2) not null
----)

--select * from Accounts
----Insert into accounts values ('Account holder A', 1000)
----Insert into accounts values ('Account holder B',300)

----BEGIN
----update accounts balance = balance - 100 where accountholder name = A
----update accounts balnce = balance +100 where acocunt holder name = b
----Commit

------ startiing
----BEGIN;
----Begin Try
------ deduct 100rs
----		Update Accounts
----		set balance = balance - 100.00
----		where accountid = 1
------- simulating some error
----	--add 100	
----		update accounts 
----		set balance = balance + 100.00
----		where accountid = 10 -- This account does not exits
----	--if all transactions are correct it should commit
----Commit
----End Try
----Begin Catch
------ if error happens we need to rollback
----Rollback;
----print 'transaction failed'
----End Catch
----update accounts 
----set balance = 1000
----where accountid = 1 

----TRANSACTION CONTROL IN SQL 

--ALTER Procedure UpdateAccountTransfer
--(
--@FromAccountID int,
--@ToAccountID int,
--@Amount decimal(10,2)
--)
--As
--BEGIN 
--		BEGIN TRANSACTION -- Begin the transaction
--			BEGIN TRY -- Catch if there is any error
--			insert into accounts values
--			('Account holder c','100.00')
--				--Deduct the money
--					Update Accounts
--					Set Balance = Balance - @Amount
--					where AccountID = @FromAccountID
--				If @@ROWCOUNT = 0 -- If there is no rows affected I'm going to throw the error manually
--					BEGIN
--						THROW 50000,'Error : No rows affection because there is no FROM account number',1 -- Throw command will throw the error manually
--					END
--				-- add the money
--					Update Accounts
--					set balance = Balance + @Amount
--					where AccountID = @ToAccountID -- For sql it will be compiled successfully even there is no row found (0 rows affected)
--				If @@ROWCOUNT = 0
--					BEGIN
--						THROW 50000,'Error : No rows affection because there is no TO account number',1
--					END
			
--				COMMIT -- Commit the changes which means save to corresponding account in accounts table
--				Print 'Transaction Successfull'
--			END TRY
--			BEGIN CATCH
--				ROLLBACK; -- Whatever transaction you tried to do in the try block will be rolled back if there is an error
--				print 'Transaction failed'
--			END CATCH
--END

--select * from Accounts
--EXEC UpdateAccountTransfer '1','2','100.00' -- 10 account is not exist