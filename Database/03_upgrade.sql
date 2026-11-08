-- NANG CAP database da co. Khong xoa sach, tai khoan hay don hang.
-- Chay truoc 04_catalog.sql; co the chay lai.
IF DB_ID(N'BookStoreOnline') IS NULL
    THROW 51000, N'Chua co database BookStoreOnline. Hay chay 01_schema.sql va 02_seed.sql truoc.', 1;
GO
USE BookStoreOnline;
GO
IF OBJECT_ID(N'dbo.Books', N'U') IS NULL
    THROW 51001, N'Chua co bang Books. Hay kiem tra database.', 1;
IF COL_LENGTH(N'dbo.Books', N'Language') IS NULL
    ALTER TABLE dbo.Books ADD Language nvarchar(50) NOT NULL CONSTRAINT DF_Books_Language DEFAULT N'Tiếng Việt';
IF COL_LENGTH(N'dbo.Books', N'Binding') IS NULL
    ALTER TABLE dbo.Books ADD Binding nvarchar(50) NOT NULL CONSTRAINT DF_Books_Binding DEFAULT N'Bìa mềm';
IF COL_LENGTH(N'dbo.Books', N'Dimensions') IS NULL
    ALTER TABLE dbo.Books ADD Dimensions nvarchar(50) NOT NULL CONSTRAINT DF_Books_Dimensions DEFAULT N'';
IF COL_LENGTH(N'dbo.Books', N'Translator') IS NULL
    ALTER TABLE dbo.Books ADD Translator nvarchar(150) NOT NULL CONSTRAINT DF_Books_Translator DEFAULT N'';
IF COL_LENGTH(N'dbo.Books', N'SourceUrl') IS NULL
    ALTER TABLE dbo.Books ADD SourceUrl nvarchar(500) NOT NULL CONSTRAINT DF_Books_SourceUrl DEFAULT N'';
GO
PRINT N'Da nang cap thong tin sach. Tiep theo chay 04_catalog.sql.';
GO
