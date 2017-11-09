CREATE TABLE [dbo].[Account]
(
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Username] VarChar(50) NOT NULL,
	[PasswordHash] NVARCHAR(MAX) NOT NULL, 
    [Salt] VARBINARY(512) NOT NULL,
	[DateJoined] Date NOT NULL
)
