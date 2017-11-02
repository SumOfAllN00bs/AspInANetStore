CREATE TABLE [dbo].[Orders]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[CustomerId] INT NOT NULL,
	CONSTRAINT FK_Orders_Customer_ID FOREIGN KEY ([CustomerId]) References [dbo].[Customers] (Id)
)
