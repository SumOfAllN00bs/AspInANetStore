CREATE TABLE [dbo].[CataloguedProducts]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[CatalogueId] INT Not Null,
	[ProductId] INT Not Null,
	CONSTRAINT FK_CataloguedProducts_Catalogue_Id FOREIGN KEY (CatalogueId) References [dbo].[Catalogue] (Id),
	CONSTRAINT FK_CataloguedProducts_Product_Id FOREIGN KEY (ProductId) References [dbo].[Products] (Id)
)
