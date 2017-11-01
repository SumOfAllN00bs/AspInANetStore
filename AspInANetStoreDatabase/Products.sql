﻿CREATE TABLE [dbo].[Products]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[ProductName] VarChar(50),
	[BaseCost] float default 0,
	[Description] VarChar(150) NULL,
	[Type] VarChar(50) NULL, 
    [Stocked] INT NULL default 0/*Was gonna use InStock but that felt like a boolean name, or quantity but that felt like it might mean the size of product like "a five pack"*/
)
