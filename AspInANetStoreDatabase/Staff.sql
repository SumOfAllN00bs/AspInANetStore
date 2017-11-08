CREATE TABLE [dbo].[Staff]
(
	[Id] INT Identity(1,1) NOT NULL PRIMARY KEY,
	[FirstName] VarChar(50) NOT NULL,
	[LastName] VarChar(50) NOT NULL,
	[UserName] VarChar(50) NOT NULL,
	[PasswordHash] NVARCHAR(MAX) NOT NULL, 
    [Salt] VARBINARY(512) NOT NULL
)
