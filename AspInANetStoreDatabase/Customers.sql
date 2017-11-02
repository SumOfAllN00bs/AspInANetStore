CREATE TABLE [dbo].[Customers]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[FirstName] VarChar(50) NOT NULL,
	[LastName] VarChar(50) NULL,
	[MiddleName] VarChar(50) NULL,
	[Phone] VarChar(20) NULL,
	[Email] VarChar(254),/*https://stackoverflow.com/questions/386294/what-is-the-maximum-length-of-a-valid-email-address*/
	[Address] VarChar(256) NOT NULL,
	[BitCoinAmount] float default 0.0,
	[DateJoined] Date NOT NULL
)
