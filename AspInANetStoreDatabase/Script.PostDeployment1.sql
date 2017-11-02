/*Set up the Catalogue*/
MERGE INTO Catalogue AS Target
USING (VALUES 
		(1, 'Snakes','A dangerous pet to have, potentially venomous. Extra cost for defanging', 100),
		(2, 'Crocodiles', 'Easy to look after, just throw them a hunk of meat every other day. No extra cost', 0),
		(3, 'Felines', 'From Leopards to Lions, from Cougar''s to Cheetah''s, we have all kinds of cats. Extra cost for neutering', 50),
		(4, 'Spiders','We have every major spider species on the planet but we specialize in Tarantulas, No extra cost', 0)
)
AS Source(Id, Name, Description, ExtraCatalogueCost)
ON Target.Id = Source.Id
WHEN NOT MATCHED BY TARGET THEN
INSERT (Name, Description, ExtraCatalogueCost)
VALUES (Name, Description, ExtraCatalogueCost);

/*Set up the Customers*/
MERGE INTO Customers AS Target
USING (VALUES 
		(1, 'David', 'Johnson', 'Barry', '02112345478', 'DbJohnson@example.com', '123 FourExample St, New York, New York, USA', 100.1, SysDateTime()),
		(2, 'Lucy', 'Garth', 'Mary', '02112345448', 'LMGarth@example.com', '13 Four St, Hampshire, New Jersey, USA', 0, SysDateTime()),
		(3, 'Melissa', 'Reece', 'Betty', '02114345678', 'MBReece@example.com', '23 Riddle Rd, Rothshire, New South Wales, Australia', 500, SysDateTime()),
		(4, 'Harry', 'Murray', 'Bob', '02112344678', 'HBMurray@example.com', '12 Needle St, MothManTown, Texas, USA', 0, SysDateTime()),
		(5, 'Valerie', 'Washington', '', '02144345678', 'VWashington@example.com', '2 NumaNuma St, Victoria, Queensland, Australia', 2, SysDateTime()),
		(6, 'Norman', 'Chase', 'J.', '02144344678', 'NJ.Chase@example.com', '1 GroupOn St, Old York, Old York, Divided States Of Yugoslavia', 5000, SysDateTime()),
		(7, 'Susie', 'York', 'T.', '02112222278', 'ST.York@example.com', '3 Script St, Jafa York, Code, Britain', 0, SysDateTime()),
		(8, 'Peter', 'Galant', 'F.', '02112322278', 'PF.Galant@example.com', '124 Galant St, Peterton, State of Fitzpatrick, New Zealand', 3, SysDateTime())
)
AS Source(Id, FirstName, LastName, MiddleName, Phone, Email, Address, BitCoinAmount, DateJoined)
ON Target.Id = Source.Id
WHEN NOT MATCHED BY TARGET THEN
INSERT (FirstName, LastName, MiddleName, Phone, Email, Address, BitCoinAmount, DateJoined)
VALUES (FirstName, LastName, MiddleName, Phone, Email, Address, BitCoinAmount, DateJoined);

/*Set up the Products*/
MERGE INTO Products AS Target
USING (VALUES 
		(1, 'Vipera aspis', 300, 'Vipera aspis is a venomous viper species found in southwestern Europe', 'Asp', 100),
		(2, 'King cobra (Ophiophagus hannah)', 500, 'This serpent is the world''s longest venomous snake. Adult king cobras are 3.18 to 4 m (10.4 to 13.1 ft) long.', 'Cobra', 50),
		(3, 'Grass snake (Natrix natrix)', 450, 'The grass snake is typically dark green or brown in colour with a characteristic yellow collar behind the head, which explains the alternative name ringed snake', 'Grass Snake', 10),
		(4, 'Dwarf crocodile (Osteolaemus tetraspis)', 800, 'The dwarf crocodile (Osteolaemus tetraspis), also known commonly as the African dwarf crocodile, broad-snouted crocodile, or bony crocodile, is an African crocodile that is also the smallest extant crocodile species.', 'Crocodile', 20),
		(5, 'Slender-snouted crocodile (Mecistops cataphractus)',1000, 'Slender-snouted crocodiles are native to freshwater habitats in central and western Africa. They are medium-sized crocodiles, typically slightly smaller than the Nile crocodile, but are larger than several other species of crocodilians.', 'Crocodile',2),
		(6, 'Freshwater crocodile (Crocodylus johnsoni)', 900, 'The freshwater crocodile is a relatively small crocodilian. Males can grow to 2.3–3 m (7.5–9.8 ft) long, while females reach a maximum size of 2.1 m (6.9 ft).', 'Fresh water Crocodile', 80),
		(7, 'Leopard (Panthera pardus)', 400, 'Compared to other members of Felidae, the leopard has relatively short legs and a long body with a large skull.', 'Leopard', 10),
		(8, 'Cougar (Puma concolor)', 450, 'The cougar is an ambush predator and pursues a wide variety of prey. Primary food sources are ungulates, particularly deer, but also livestock. It also hunts species as small as insects and rodents.', 'Cougar', 1),
		(9, 'Cheetah (Acinonyx jubatus)', 300,'Cheetahs are active mainly during the day, with hunting their major activity. Adult males are sociable despite their territoriality, forming groups called ''coalitions''.', 'Cheetah', 30),
		(10, 'Redback spider (Latrodectus hasseltii)', 100, 'Mainly nocturnal, the female redback lives in an untidy web in a warm sheltered location, commonly near or inside human residences. It preys on insects, spiders and small vertebrates that become ensnared in its web.', 'Spider', 14),
		(11, 'Goliath birdeater (Theraphosa blondi)', 120, 'The goliath birdeater is native to the upland rain forest regions of northern South America: Suriname, Guyana, French Guiana, northern Brazil and southern Venezuela.', 'Tarantula', 12),
		(12, 'Antilles pinktoe tarantula (Caribena versicolor)', 300, 'Spiderlings of C. versicolor are bright blue, with a black tree trunk pattern on the abdomen. As they grow, they gradually lose their blue coloration; the carapace turns green, the abdomen red, and the legs turn green with pink tarsi and a covering of purple hairs.', 'Tarantula', 7)
)
AS Source(Id, ProductName, BaseCost, Description, Type, Stocked)
ON Target.Id = Source.Id
WHEN NOT MATCHED BY TARGET THEN
INSERT (ProductName, BaseCost, Description, Type, Stocked)
VALUES (ProductName, BaseCost, Description, Type, Stocked);

/*Set up the CataloguedProducts*/
MERGE INTO CataloguedProducts AS Target
USING (VALUES 
		(1, 1, 1),
		(2, 1, 2),
		(3, 1, 3),
		(4, 2, 4),
		(5, 2, 5),
		(6, 2, 6),
		(7, 3, 7),
		(8, 3, 8),
		(9, 3, 9),
		(10, 4, 10),
		(11, 4, 11),
		(12, 4, 12)
)
AS Source(Id, CatalogueId, ProductId)
ON Target.Id = Source.Id
WHEN NOT MATCHED BY TARGET THEN
INSERT (CatalogueId, ProductId)
VALUES (CatalogueId, ProductId);

/*Set up the Orders*/
MERGE INTO Orders AS Target
USING (VALUES 
		(1,8),
		(2,6),
		(3,4),
		(4,2),
		(5,8)
)
AS Source(Id, CustomerId)
ON Target.Id = Source.Id
WHEN NOT MATCHED BY TARGET THEN
INSERT (CustomerId)
VALUES (CustomerId);

/*Set up the ProductOrders*/
MERGE INTO ProductOrders AS Target
USING (VALUES 
		(1, 1, 12, 1),/*Peter Galant orders 1 Pinktoe Tarantula*/
		(2, 1, 3, 2),/*and 2 grass snakes*/
		(3, 2, 11, 1),/*Norman orders 1 Goliath Bird Eater*/
		(4, 3, 5, 1),
		(5, 4, 1, 1),
		(6, 5, 6, 1)
)
AS Source(Id, OrderId, ProductId, Quantity) 
ON Target.Id = Source.Id
WHEN NOT MATCHED BY TARGET THEN
INSERT (OrderId, ProductId, Quantity) 
VALUES (OrderId, ProductId, Quantity);