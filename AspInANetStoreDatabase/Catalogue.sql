CREATE TABLE [dbo].[Catalogue]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] VarChar(50),
	[Description] VarChar(150),
	[ExtraCatalogueCost] float null default 0, 
    [CatagoryImage] VARCHAR(2048) NULL
)
