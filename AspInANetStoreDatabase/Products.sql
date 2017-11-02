CREATE TABLE [dbo].[Products]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[ProductName] VarChar(50),
	[BaseCost] float default 0,
	[Description] VarChar(MAX) NULL,
	[Type] VarChar(50) NULL, 
    [Stocked] INT NULL default 0/*Was gonna use InStock but that felt like a boolean name, or quantity but that felt like it might mean the size of product like "a five pack"*/
)
