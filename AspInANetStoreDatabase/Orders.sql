CREATE TABLE [dbo].[Orders]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[CustomerID] INT NOT NULL,
	CONSTRAINT FK_Orders_Customer_ID FOREIGN KEY (CustomerID) References [dbo].[Customers] (Id)
)
