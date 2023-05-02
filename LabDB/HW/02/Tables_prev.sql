CREATE TABLE Member
(
    MemberId INT NOT NULL PRIMARY KEY,
    IDCard INT NOT NULL,
    FName [NVARCHAR](50) NOT NULL,
    LName [NVARCHAR](50) NOT NULL,
    Age INT NOT NULL,
    BirthDate [NVARCHAR](10) NOT NULL,
    Addresses [NVARCHAR](30),
    TelNumber INT,
);
CREATE TABLE Book
(
    ISBN INT NOT NULL PRIMARY KEY,
    Titel [NVARCHAR](50) NOT NULL,
    Field [NVARCHAR](50) NOT NULL,
    AuthorName [NVARCHAR](50) NOT NULL,
    AuthorID INT NOT NULL FOREIGN KEY REFERENCES Author(AuthorID),
    LimitAge INT NOT NULL,
    PubDate [NVARCHAR](10) NOT NULL,
    PubAddresses [NVARCHAR](30),
    PubNumber INT,
);
CREATE TABLE Author
(
    AuthorID INT NOT NULL PRIMARY KEY,
    FName [NVARCHAR](50) NOT NULL,
    LName [NVARCHAR](50) NOT NULL,
    AuthorField [NVARCHAR](50) NOT NULL,
    Age INT,
    BirthDate [NVARCHAR](10) NOT NULL,
    Addresses [NVARCHAR](30),
    TelNumber INT,
);
CREATE TABLE Libarary
(
    LibID INT NOT NULL PRIMARY KEY,
    LibName [NVARCHAR](50) NOT NULL,
    AuthorField [NVARCHAR](50) NOT NULL,
    LibStartDate [NVARCHAR](10) NOT NULL,
    LibAddresses [NVARCHAR](30),
    LibTelNumber INT,
    EmployeeID INT NOT NULL FOREIGN KEY REFERENCES Employee(EmployeeID),
    LibManagerID INT NOT NULL NULL FOREIGN KEY REFERENCES Manager(LibManagerID),
    LibBookID INT NOT NULL FOREIGN KEY REFERENCES Book(ISBN),
    LibMemberID INT NOT NULL FOREIGN KEY REFERENCES Member(MemberId)
);
CREATE TABLE Manager
(
    LibManagerID INT NOT NULL PRIMARY KEY,
    FName [NVARCHAR](50) NOT NULL,
    LName [NVARCHAR](50) NOT NULL,
    ManagerStatus [NVARCHAR](50) NOT NULL,
    Age INT,
    BirthDate [NVARCHAR](10) NOT NULL,
    Addresses [NVARCHAR](30),
    TelNumber INT,
);
CREATE TABLE Employee
(
    EmployeeID INT NOT NULL PRIMARY KEY,
    FName [NVARCHAR](50) NOT NULL,
    LName [NVARCHAR](50) NOT NULL,
    Employesstatus [NVARCHAR](50) NOT NULL,
    Age INT,
    BirthDate [NVARCHAR](10) NOT NULL,
    Addresses [NVARCHAR](30),
    TelNumber INT,
);
