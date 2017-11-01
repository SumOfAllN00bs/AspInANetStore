/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
MERGE INTO Catalogue AS Target
USING (VALUES 
		(1, "Snakes","A dangerous pet to have, potentially venomous. Extra cost for defanging", 100)
		(2, "Crocodiles", "Easy to look after, just throw them a hunk of meat every other day. No extra cost", 0)
		(3, "Felines", "From Leopards to Lions, from Cougar's to Cheetah's, we have all kinds of cats. Extra cost for neutering", 50)
		(4, "Spiders","We have every major spider species on the planet but we specialize in Tarantulas, No extra cost", 0)
)
AS SOURCE(Id, Name, Description, ExtraCatalogueCost)
ON Target.Id = Source.Id
WHEN NOT MATCHED BY TARGET THEN
INSERT (Name, Description, ExtraCatalogueCost)
VALUES (Name, Description, ExtraCatalogueCost);

