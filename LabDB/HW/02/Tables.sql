-- Create a new table called 'Member' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Member', 'U') IS NOT NULL
DROP TABLE dbo.Member
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Member
(
    MemberId INT NOT NULL PRIMARY KEY, -- primary key column
    IDCard INT NOT NULL,
    FName [NVARCHAR](50) NOT NULL,
    LName [NVARCHAR](50) NOT NULL,
    Age INT NOT NULL,
    BirthDate [NVARCHAR](10) NOT NULL,
    Addresses [NVARCHAR](30),
    TelNumber INT,
);
GO

-- Create a new table called 'Book' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Book', 'U') IS NOT NULL
DROP TABLE dbo.Book
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Book
(
    ISBN INT NOT NULL PRIMARY KEY, -- primary key column
    Titel [NVARCHAR](50) NOT NULL,
    Field [NVARCHAR](50) NOT NULL,
    AuthorName [NVARCHAR](50) NOT NULL,
 --   AuthorID INT NOT NULL FOREIGN KEY REFERENCES Author(AuthorID),
    LimitAge INT NOT NULL,
    PubDate [NVARCHAR](10) NOT NULL,
    PubAddresses [NVARCHAR](30),
    PubNumber INT,
);
GO

-- Create a new table called 'Author' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Author', 'U') IS NOT NULL
DROP TABLE dbo.Author
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Author
(
    AuthorID INT NOT NULL PRIMARY KEY, -- primary key column
    FName [NVARCHAR](50) NOT NULL,
    LName [NVARCHAR](50) NOT NULL,
    AuthorField [NVARCHAR](50) NOT NULL,
    Age INT,
    BirthDate [NVARCHAR](10) NOT NULL,
    Addresses [NVARCHAR](30),
    TelNumber INT,
);
GO

-- Create a new table called 'Libarary' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Libarary', 'U') IS NOT NULL
DROP TABLE dbo.Libarary
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Libarary
(
    LibID INT NOT NULL PRIMARY KEY, -- primary key column
    LibName [NVARCHAR](50) NOT NULL,
    AuthorField [NVARCHAR](50) NOT NULL,
    LibStartDate [NVARCHAR](10) NOT NULL,
    LibAddresses [NVARCHAR](30),
    LibTelNumber INT,
    -- EmployeeID INT NOT NULL FOREIGN KEY REFERENCES Employee(EmployeeID),
    -- LibManagerID INT NOT NULL NULL FOREIGN KEY REFERENCES Manager(LibManagerID),
    -- LibBookID INT NOT NULL FOREIGN KEY REFERENCES Book(ISBN),
    -- LibMemberID INT NOT NULL FOREIGN KEY REFERENCES Member(MemberId)
);
GO

-- Create a new table called 'Manager' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Manager', 'U') IS NOT NULL
DROP TABLE dbo.Manager
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Manager
(
    LibManagerID INT NOT NULL PRIMARY KEY, -- primary key column
    FName [NVARCHAR](50) NOT NULL,
    LName [NVARCHAR](50) NOT NULL,
    ManagerStatus [NVARCHAR](50) NOT NULL,
    Age INT,
    BirthDate [NVARCHAR](10) NOT NULL,
    Addresses [NVARCHAR](30),
    TelNumber INT,
);
GO

-- Create a new table called 'Employee' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL
DROP TABLE dbo.Employee
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Employee
(
    EmployeeID INT NOT NULL PRIMARY KEY, -- primary key column
    FName [NVARCHAR](50) NOT NULL,
    LName [NVARCHAR](50) NOT NULL,
    Employesstatus [NVARCHAR](50) NOT NULL,
    Age INT,
    BirthDate [NVARCHAR](10) NOT NULL,
    Addresses [NVARCHAR](30),
    TelNumber INT,
);
GO