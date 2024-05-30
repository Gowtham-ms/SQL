--Joins in SQL 

--   - Inner joins ( Matching rows)
--   - Left joins (matching rows of 1st table and return null of second table)
--   - Right joins (matching rows of 2nd table and return null of first table)
--   - Full outer joins (Matching rows if there is no rows in both table it will return null for both the table)
--   - Self joins (returns matching rows and table join with itself)
--   - Cross joins (Cartesian product of first table and return the 2nd table with matching first table rows)

--Combine rows from two or more tables based on the related column

--Create Table Book
--(
--ID int Primary Key identity(1,1),
--BookName nvarchar(40),
--Genre nvarchar(30)
--)

--Create Table Author
--(
--AuthorID int Primary key identity(1,1),
--AuthorName nvarchar(40),
--BookID int
--Foreign Key (BookID) references Book(ID)
--)


--insert into Book
--values('The Almanack of Naval Ravikanth','Finance')

--insert into Author
--values('Eric',1)

--insert into Book
--values('Two more book','Drama')

--insert into Author
--values('Someone wrote it','')

select * from Book
Select * from Author

Select Bookname,Genre from Book
select AuthorName from Author

--Joins 
--Inner joins - Returns only the rows where there is a match in both tables
select B.BookName as Book, B.Genre, A.AuthorName as Author from Book as B
inner join Author as A
on B.ID = A.BookID

--Left - first Table 
--Right - Second Table
--Left Joins - Returns all the rows from the left table (first table) and the matched rows from the right table (second table)
--, if there is no match it will return null
select * from Book as B-- Table 1 
left  join Author as A--- Table 2
--On B.ID = A.BookID
On A.BookID = B.ID

--Right join -- Returns all the rows from the right table (second Table) and the matched rows from the left table (1st table),
--if there is no match it will return null
select B.BookName as Book, B.Genre, A.AuthorName as Author from Author as A-- Table 1 
right join Book as B--- Table 2
On B.ID = A.BookID

-- Full Join(Full outer join) -- Returns all the rows when there is match in one of the table and it will return null for non matching rows from both tables
select * from Book as B
full join Author as A
on B.ID = A.BookID


SElect * from Book 
cross join Author


--Create Table Student
--(
--ID int primary key identity (1,1),
--Name nvarchar(40)
--)
--Create Table Teacher
--(
--ID int primary key identity(1,1),
--Name nvarchar(50)
--)
select * from student
select * from Teacher
--Insert into student
--values('Fifth Student')

--Insert into Teacher
--values('First Teacher')

--Insert into Teacher
--values('Fifth Teacher')

--delete from student where id = 3



select * from student
select * from Teacher
--Joins 
--Inner joins - Returns only the rows where there is a match in both tables
select * from Student as B
inner join Teacher as A
on B.ID = A.ID

--Left - first Table 
--Right - Second Table
--Left Joins - Returns all the rows from the left table (first table) and the matched rows from the right table (second table)
--, if there is no match it will return null
select* from Student as B-- Table 1 
left  join Teacher as A--- Table 2
on B.ID = A.ID

--Right join -- Returns all the rows from the right table (second Table) and the matched rows from the left table (1st table),
--if there is no match it will return null
select* from Student as A-- Table 1 
right join Teacher as B--- Table 2
on B.ID = A.ID

-- Full Join(Full outer join) -- Returns all the rows when there is match in one of the table and it will return null for non matching rows from both tables
select * from Student as B
full join Teacher as A
on B.ID = A.ID


-- Cross Join -- Returns the cartesian product of the two tables , combining each row of the first table with all rows of the second table
select * from Student 
cross join Teacher

-- Self join -> Table joins with itself

--Create Table Employee
--(
--ID int primary key identity(1,1),
--FirstName nvarchar(40),
--LastName nvarchar(40)
--)

--alter table Employee
--drop column LastName

select * from employee

--insert into employee
--values ('Employee4','1')

--update employee
--set Firstname = 'Team Member 2' 
--where id = 4


--SELF Join - Is a join of a table with itself

select T1.FirstName as Employee, T2.FirstName as Reportees 
from Employee as T1
join Employee T2
on T1.ManagerID = T2.ID

--Team Lead Boss
--Team Member1 Team Lead
--Boss 
--Team Member 2 Team Lead


