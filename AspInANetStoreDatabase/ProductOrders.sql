CREATE TABLE [dbo].[ProductOrders]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[OrderId] INT NOT NULL,
	[ProductId] INT NOT NULL,
	[Quantity] INT NOT NULL DEFAULT 1,
	CONSTRAINT FK_ProductOrders_Order_Id FOREIGN KEY (OrderId) References [dbo].[Orders] (Id),
	CONSTRAINT FK_ProductOrders_Product_Id FOREIGN KEY (ProductId) References [dbo].[Products] (Id)
)
