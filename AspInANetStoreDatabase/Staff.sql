CREATE TABLE [dbo].[Staff]
(
	[Id] INT Identity(1,1) NOT NULL PRIMARY KEY,
	[FirstName] VarChar(50) NOT NULL,
	[LastName] VarChar(50) NOT NULL,
	[AccountId] INT NOT NULL,
	CONSTRAINT FK_Staff_Account_Id FOREIGN KEY(AccountId) REFERENCES [dbo].[Account](Id)

)
