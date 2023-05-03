-- Create a new database called 'Employee'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
	SELECT name
		FROM sys.databases
		WHERE name = N'Employee'
)
CREATE DATABASE Employee
GO
---------------------------------------
USE Employee;
GO
---------------------------------------
IF OBJECT_ID('dbo.spec', 'U') IS NOT NULL
	DROP TABLE dbo.spec
GO
CREATE TABLE spec(
	emp_no INT PRIMARY KEY,
	fname NVARCHAR(20) NOT  NULL,
	lname NVARCHAR(20) NOT NULL,
	C_id CHAR(20) NULL,
	mellicode CHAR(10),
	birthDate datetime NULL,
	marry BIT NOT NULL,
	course NVARCHAR(50),
	grade NVARCHAR(20),
	phone CHAR(11) NULL,
)
---------------------------------------
CREATE INDEX idx ON spec(lname)
---------------------------------------
IF OBJECT_ID('dbo.wife', 'U') IS NOT NULL
	DROP TABLE dbo.wife
GO
CREATE TABLE wife(
	emp_no INT PRIMARY KEY FOREIGN KEY REFERENCES spec(emp_no),
	wname NVARCHAR(20) NOT  NULL,
	wlname NVARCHAR(20) NOT NULL,
)
-------------------------------------
IF OBJECT_ID('dbo.project', 'U') IS NOT NULL
	DROP TABLE dbo.project
GO
CREATE TABLE project(
	proj_no INT IDENTITY(1201, 1) PRIMARY KEY,
	Pname NVARCHAR(40),
	Psubject NVARCHAR(100),
	Price MONEY,
)
---------------------------------------
IF OBJECT_ID('dbo.works', 'U') IS NOT NULL
	DROP TABLE dbo.works
GO
CREATE TABLE works(
	emp_no INT PRIMARY KEY
		FOREIGN KEY REFERENCES spec(emp_no) ON DELETE CASCADE,
	begin_date DATETIME NULL,
	end_date DATETIME NULL,
	job nvarchar(50) NULL,
	Overtime FLOAT NULL,
	absent FLOAT NULL,
	tax FLOAT NULL,
	account NCHAR(20) NULL,
	bime_no INT NULL,
)
---------------------------------------
IF OBJECT_ID('dbo.groupp', 'U') IS NOT NULL
	DROP TABLE dbo.groupp
GO
CREATE TABLE groupp(
	group_no INT PRIMARY KEY,
	Base_Salary FLOAT NULL,
	CHECK (group_no <= 20)
)
---------------------------------------
IF OBJECT_ID('dbo.department', 'U') IS NOT NULL
	DROP TABLE dbo.department
GO
CREATE TABLE department(
	dept_no INT NOT NULL UNIQUE,
	Dname NVARCHAR(20) NULL,
	Dphon NCHAR(11) NULL,
	DAddress NVARCHAR(60) NULL,
)
---------------------------------------
IF OBJECT_ID('dbo.child', 'U') IS NOT NULL
	DROP TABLE dbo.child
GO
CREATE TABLE child(
	child_no INT PRIMARY KEY,
	emp_no INT FOREIGN KEY REFERENCES spec(emp_no) ON DELETE CASCADE,
	chname NVARCHAR(20),
	chbirthdate DATETIME NULL,
)
---------------------------------------
IF OBJECT_ID('dbo.DataID', 'U') IS NOT NULL
	DROP TABLE dbo.DataID
GO
CREATE TABLE DataID(
	emp_no INT PRIMARY KEY FOREIGN KEY REFERENCES spec(emp_no),
	dept_no INT FOREIGN KEY REFERENCES department(dept_no),
	group_no INT FOREIGN KEY REFERENCES groupp(group_no),
	proj_no INT FOREIGN KEY REFERENCES project(proj_no),
)
---------------------------------------
INSERT INTO spec
VALUES
	(1001, 'Ahmad', 'Moradi', 32, 6917412593, 1989/10/10, 'true', '', '', 55442525),
	(1002, 'Mohammad', 'Arbabi', 125, 5491236523, 1994/04/02, 'false', '', '', 32544521),
	(1003, 'Maryam', 'Iranian', 854, 5497412583, 1995/09/02, 'true', '', '', 55542514),
	(1004, 'Hamid', 'Mohammadi', 4514, 1281254145, 1989/04/10, 'false', '', '', 5472889),
	(1005, 'Ali', 'Mohammadzade', 1451, 1250772896, 1994/04/08, 'false', '', '', 55250004)
---------------------------------------
INSERT INTO department
VALUES
	(32, 'edari', 5915301, ''),
	(33, 'ketabkhane', 5918408, ''),
	(34, 'azmayeshgah', 5912487, '')
---------------------------------------
INSERT INTO groupp
VALUES
	(11, 350000),
	(12, 4000000),
	(13, 4500000)
---------------------------------------
SET IDENTITY_INSERT project OFF
INSERT INTO project
VALUES
	('system ketabdari', 'fehreste nobat va amani', 10000000),
	('system hesabdari', 'asnad kharid', 15000000),
	('system anbar', 'tarahi va piade sazi', 20000000),
	('system hoghogh', 'tarahi va piade sazi', 25000000)
---------------------------------------
INSERT INTO works(
	emp_no , begin_date, end_date, job, Overtime, absent, tax, account, bime_no
)
VALUES
	(1001, 2000/01/01, '', 'ketabdae', '', '', '', 1609023331, 0),
	(1002, 2001/01/01, '', 'hesabdar', '', '', '', 1609023332, 0),
	(1003, 2002/07/01, '', 'azmayeshgah', '', '', '', 1609023333, 0),
	(1004, 2010/07/01, '', 'hoghogh', '', '', '', 1609023334, 0)
---------------------------------------
INSERT INTO DataID
VALUES
	(1001, 33, 11, 1201),
	(1002, 32, 11, 1202),
	(1003, 34, 12, 1203),
	(1004, 32, 13, 1204)
---------------------------------------
