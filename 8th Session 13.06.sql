--Indexes

--Index are nothing but database objects , it will improve the speed/performance of data retreival

--Why ? -> speeding up -> quickly lookup the row number and get you the data (just like index in books)
---> Drastically improve the performance especially useful in large tables where full table scans are costly
--> Optimizing queries when we use in Where , Order By , Join , Group by
--select * from Department where ID in(1, 10, 14, 1020, 34325)

--Types of Indexes 1. Primary Key Index -> Will be automatically created when a primary key is defined in a table
--2. Unique Index : All the values in the index are unique, it will prevent duplicates 
---3. Composite Index : Composite key an index on multiple columns use when ever you're quering multiple columns in where clause

--Create Table IndexTable --> Alt + F1
--(
--ID int primary key identity(1,1),
--Index_name nvarchar(10),
--Index_Location nvarchar(15)
--)

--4. Clustered Index : Define the physical order of data in a table (Book index)
--5. Non clustered index : Does not alter the physical order but it will create a separate structure to hold pointers to the data

--select * from book where chaptername = 'introduction'

--Create Index
--Create Index Index_Name
--ON Table_Name (column_Name)

Create Table Books
(
ID int identity(1,1),
BookName nvarchar(100),
AuthorName nvarchar(100)
)

--Create Index idx_bookname
--on Books(bookname)


--Clustered Index - Will be created automatically whenever you're assiging a primary key to a column => Only 1 clustered index per table
--Non clustered index - You can multiple non clustered indexes
select * from books

select * from books where BookName = 'BookName 3'

--> without index the database must scan the entire table to find rows where bookname is bookname 3
--> after index Database can quickly locate the rows with booknmae is 3 => it will improve the performance

--Drop syntax
--Drop Index idx_bookname
--on books

--Advantages -> Improve the performance , it holds the pointer to data , we can create n number of index in table, reading the data 
-- Disadvantages
--1. heavy workloads -> whenever you're doing insert, update, delete -> index slow 

--100s of columns => we 30 columns values 

--whenever we're inserting / writing operations it will slow down because it will update the index each time a row is inserted/update/delete
--- Small tables => it will scan the whole table 
-- Whenever we are having some complex queries with multiple joins --

-- we've create index when it is absolutely necessary 

--> we can create index for temp table