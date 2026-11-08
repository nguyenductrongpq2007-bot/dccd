-- Run in SQL Server Management Studio. Fresh database only; never overwrite a live database.
USE master;
GO
IF DB_ID(N'BookStoreOnline') IS NULL CREATE DATABASE BookStoreOnline;
GO
USE BookStoreOnline;
GO
CREATE TABLE Categories(Id int IDENTITY PRIMARY KEY,Name nvarchar(100) NOT NULL UNIQUE);
CREATE TABLE Authors(Id int IDENTITY PRIMARY KEY,Name nvarchar(150) NOT NULL UNIQUE);
CREATE TABLE Publishers(Id int IDENTITY PRIMARY KEY,Name nvarchar(150) NOT NULL UNIQUE);
CREATE TABLE Users(Id int IDENTITY PRIMARY KEY,FullName nvarchar(100) NOT NULL,Email nvarchar(254) NOT NULL UNIQUE,PasswordHash nvarchar(600) NOT NULL,Role nvarchar(20) NOT NULL DEFAULT N'Customer' CHECK(Role IN(N'Customer',N'Admin')),IsActive bit NOT NULL DEFAULT 1,CreatedAt datetime2 NOT NULL DEFAULT SYSUTCDATETIME());
CREATE TABLE Books(Id int IDENTITY PRIMARY KEY,Title nvarchar(250) NOT NULL,Description nvarchar(max) NOT NULL,Isbn nvarchar(30) NOT NULL,CategoryId int NOT NULL REFERENCES Categories(Id),AuthorId int NOT NULL REFERENCES Authors(Id),PublisherId int NOT NULL REFERENCES Publishers(Id),Price decimal(18,0) NOT NULL CHECK(Price>0),ListPrice decimal(18,0) NOT NULL,Stock int NOT NULL CHECK(Stock>=0),Pages int NOT NULL,Year int NOT NULL,ImagePath nvarchar(300) NOT NULL,SampleText nvarchar(max) NOT NULL,IsActive bit NOT NULL DEFAULT 1,CreatedAt datetime2 NOT NULL DEFAULT SYSUTCDATETIME(),CONSTRAINT CK_Books_Prices CHECK(ListPrice>=Price));
CREATE TABLE Orders(Id int IDENTITY PRIMARY KEY,CheckoutKey nvarchar(32) NOT NULL UNIQUE,UserId int NOT NULL REFERENCES Users(Id),Recipient nvarchar(100) NOT NULL,Phone nvarchar(20) NOT NULL,Address nvarchar(500) NOT NULL,Note nvarchar(1000) NOT NULL,ShippingFee decimal(18,0) NOT NULL,Total decimal(18,0) NOT NULL,Status nvarchar(30) NOT NULL DEFAULT N'Chờ duyệt' CHECK(Status IN(N'Chờ duyệt',N'Đang giao',N'Đã giao')),PaymentMethod nvarchar(20) NOT NULL DEFAULT N'COD',CreatedAt datetime2 NOT NULL DEFAULT SYSUTCDATETIME());
CREATE TABLE OrderItems(Id int IDENTITY PRIMARY KEY,OrderId int NOT NULL REFERENCES Orders(Id) ON DELETE CASCADE,BookId int NOT NULL REFERENCES Books(Id),BookTitle nvarchar(250) NOT NULL,Quantity int NOT NULL CHECK(Quantity>0),UnitPrice decimal(18,0) NOT NULL CHECK(UnitPrice>0));
CREATE INDEX IX_Books_CategoryId ON Books(CategoryId);
CREATE INDEX IX_Books_AuthorId ON Books(AuthorId);
CREATE INDEX IX_Books_PublisherId ON Books(PublisherId);
CREATE INDEX IX_Orders_UserId ON Orders(UserId);
CREATE INDEX IX_OrderItems_OrderId ON OrderItems(OrderId);
CREATE INDEX IX_OrderItems_BookId ON OrderItems(BookId);
GO
