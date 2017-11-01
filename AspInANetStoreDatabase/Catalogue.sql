CREATE TABLE [dbo].[Catalogue]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[Name] VarChar(50),
	[Description] VarChar(150),
	[ExtraCatalogueCost] float null default 0
)
