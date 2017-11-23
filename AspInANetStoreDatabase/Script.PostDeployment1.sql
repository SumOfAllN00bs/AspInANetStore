/*Set up the Catalogue / catagory*/
MERGE INTO Catalogue AS Target
USING (VALUES 
		(1, 'Snakes','A dangerous pet to have, potentially venomous. Extra cost for defanging', 100, 'https://s.hswstatic.com/gif/snakes-toilet-pipe-orig.jpg', 'DarkGreen'),
		(2, 'Crocodiles', 'Easy to look after, just throw them a hunk of meat every other day. No extra cost', 0,'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Nile_crocodile_head.jpg/1200px-Nile_crocodile_head.jpg', 'CadetBlue'),
		(3, 'Felines', 'From Leopards to Lions, from Cougar''s to Cheetah''s, we have all kinds of cats. Extra cost for neutering', 50,'https://www.wildvoyager.com/wp-content/uploads/2016/11/20150727-DSC_8962-2.jpg', 'GoldenRod'),
		(4, 'Spiders','We have every major spider species on the planet but we specialize in Tarantulas, No extra cost', 0,'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Orb_weaver_spider_day_web03.jpg/1200px-Orb_weaver_spider_day_web03.jpg', 'MidnightBlue')
)
AS Source(Id, Name, Description, ExtraCatalogueCost, CatagoryImage, CatagoryColor)
ON Target.Id = Source.Id
WHEN NOT MATCHED BY TARGET THEN
INSERT (Name, Description, ExtraCatalogueCost, CatagoryImage, CatagoryColor)
VALUES (Name, Description, ExtraCatalogueCost, CatagoryImage, CatagoryColor);

/*Set up the Account*/
MERGE INTO Account AS Target
USING (VALUES /*Customer passwords are their phone number*/
		(1, 'DbJohnson', 'VdBSSf6KU+716wbtaymj6UARmvc3FS6qf9mJ+af7It73v2ffyoB0p1zCF+n2+ggtaTrlweOMtaAoBo8kOhJt3Wt5Z7ZQuNzEk6Ax/j4C6mwF9CX0+NicKEIyUcG2F0X1', 0x6B7967B650B8DCC493A031FE3E02EA6C05F425F4F8D89C28423251C1B61745F5, SysDateTime()),
		(2, 'LMGarth', 'j/0ImnpoIgLyU1NDfW5IIE1EqobcMSb4lGGiDlN1d7U5DZ/ZPLaBEFNTylr03wCd8W/kdCv9M+/NEjHBJPibS0L7l0rRe01YzVCM6qe3EjoLE8z7LxtrqzPey3Nm09UK', 0x42FB974AD17B4D58CD508CEAA7B7123A0B13CCFB2F1B6BAB33DECB7366D3D50A, SysDateTime()),
		(3, 'MBReece', 'B7vSyBEoaN6hGY0Agj8bxSz1Z5Etw5om17T6Z3Oh317Vlt69K6XOLvzOvZG6iz7COqNqNYOZEIG1fYmG74EProPPqvZpK1cJ0MyVsa1BEHazENfsdNshYwT+mJfiYoMU', 0x83CFAAF6692B5709D0CC95B1AD411076B310D7EC74DB216304FE9897E2628314, SysDateTime()),
		(4, 'HBMurray', 'GDzct7Q+AxjWAtuDiswSPsbM3/o8Ca/FWxjqpe3prNrth77G6M5WuANf3hHwvWTRl1y1AiAdFOddDEzR5gRnbIoXxu4WCVTNbjIkFrKR5ajuvOaJpKm1QLWoHdaEPHs5', 0x8A17C6EE160954CD6E322416B291E5A8EEBCE689A4A9B540B5A81DD6843C7B39, SysDateTime()),
		(5, 'VWashington', '8v58JCL6CVVwjxARIs9zxFTa9S5q9yFEpqeZtG2GmChNczBgasNvGd9KDqQzltDQoi7L4hTc6yM8cYfkAKP/CSG149Hv/BQYv8JCmAGmmHuEfuPk2h1wBnBie6ZKWXlj', 0x21B5E3D1EFFC1418BFC2429801A6987B847EE3E4DA1D700670627BA64A597963, SysDateTime()),
		(6, 'Chase', '/aZlC5dSAGDzV+Av6nMnBRPJ8Pm2uJLyzedFSp+a77/lA9wo7qdTq4X0GbhvIln9GX2osWJbNQWpqPJoAEM0KEObXeVokTvnBqtrmeXSDEVAKe5FaVXWIbuDZCJakTjZ', 0x439B5DE568913BE706AB6B99E5D20C454029EE456955D621BB8364225A9138D9, SysDateTime()),
		(7, 'ST.York', 'y0jAPW7/1ACAWTTj0A1shIO8ViV8eC5jIPKaSsuoA0Sfzb2RGArCoHMWvEeIsTy/+yijmj1omnqs6BvZR9bapcQ8+o1npv3rouhM35FdvC5Tdp0xdBCmMcKWjWzobivX', 0xC43CFA8D67A6FDEBA2E84CDF915DBC2E53769D317410A631C2968D6CE86E2BD7, SysDateTime()),
		(8, 'PF.Galant', 'xhTMLgQuUUrdXwPwYFZne17HUswTwkx+KQ0AHUQQN/80PYM43FXFTXSf/4jCmy0FuiCp26TwOCA9QMQRaU9ZJktLAnxW1wWgofjR/ni8Cb6nMKyLSPdQGbOKi7LvXA4o', 0x4B4B027C56D705A0A1F8D1FE78BC09BEA730AC8B48F75019B38A8BB2EF5C0E28, SysDateTime()),
		/* Staff passwords are "01KH01" and "sudoadmin" */
		(9, 'KHarvey', '19Cq6j+DtmhK974Z0efKJO9qbfKKXALXOuiacEnEOFK/gNYffnd2dLfqbVS+nRCbDeFJs2UzD6ivPm/7rJGBggVNmmvpwIV9jx/0oCS9PwsYFHttBHXSJJeahH8NyASG', 0x054D9A6BE9C0857D8F1FF4A024BD3F0B18147B6D0475D224979A847F0DC80486, SysDateTime()),
		(10, 'admin', 'WghSVGISgGLBbOcQk70MIOzXCosiFk1/wFWUtF5+Ga/TtfcOtkBJch1uBT2Tfuh1WxmmDaF4uKIIAGYhjX/zY8m4XNHBOPChqnA4xuo3myCC5CLqLYBWSW8g/lVurU3f', 0xC9B85CD1C138F0A1AA7038C6EA379B2082E422EA2D8056496F20FE556EAD4DDF, SysDateTime())
)
AS Source(Id, Username, PasswordHash, Salt, DateJoined) 
ON Target.Id = Source.Id
WHEN NOT MATCHED BY TARGET THEN
INSERT (Username, PasswordHash, Salt, DateJoined) 
VALUES (Username, PasswordHash, Salt, DateJoined); 

/*Set up the Customers*/
MERGE INTO Customers AS Target
USING (VALUES 
		(1, 'David', 'Johnson', 'Barry', '02112345478', 'DbJohnson@example.com', '123 FourExample St, New York, New York, USA', 100.1, 1),
		(2, 'Lucy', 'Garth', 'Mary', '02112345448', 'LMGarth@example.com', '13 Four St, Hampshire, New Jersey, USA', 0, 2),
		(3, 'Melissa', 'Reece', 'Betty', '02114345678', 'MBReece@example.com', '23 Riddle Rd, Rothshire, New South Wales, Australia', 500, 3),
		(4, 'Harry', 'Murray', 'Bob', '02112344678', 'HBMurray@example.com', '12 Needle St, MothManTown, Texas, USA', 0, 4),
		(5, 'Valerie', 'Washington', '', '02144345678', 'VWashington@example.com', '2 NumaNuma St, Victoria, Queensland, Australia', 2, 5),
		(6, 'Norman', 'Chase', 'J.', '02144344678', 'NJ.Chase@example.com', '1 GroupOn St, Old York, Old York, Divided States Of Yugoslavia', 5000, 6),
		(7, 'Susie', 'York', 'T.', '02112222278', 'ST.York@example.com', '3 Script St, Jafa York, Code, Britain', 0, 7),
		(8, 'Peter', 'Galant', 'F.', '02112322278', 'PF.Galant@example.com', '124 Galant St, Peterton, State of Fitzpatrick, New Zealand', 3, 8)
)
AS Source(Id, FirstName, LastName, MiddleName, Phone, Email, Address, BitCoinAmount, AccountId)
ON Target.Id = Source.Id
WHEN NOT MATCHED BY TARGET THEN
INSERT (FirstName, LastName, MiddleName, Phone, Email, Address, BitCoinAmount, AccountId)
VALUES (FirstName, LastName, MiddleName, Phone, Email, Address, BitCoinAmount, AccountId);

/*Set up the Products*/
MERGE INTO Products AS Target
USING (VALUES 
		(1, 'Vipera aspis', 'http://www.freenatureimages.eu/animals/Reptilia,%20Reptielen,%20Reptiles/Vipera%20aspis,%20Asp%20Viper/Vipera%20aspis%205,%20Aspisadder,%20Saxifraga-Edo%20van%20Uchelen.jpg', 300, 'Vipera aspis is a venomous viper species found in southwestern Europe', 'Asp', 100),
		(2, 'King cobra (Ophiophagus hannah)', 'https://www.likefigures.com/media/catalog/product/cache/1/image/1200x/040ec09b1e35df139433887a97daa66f/c/o/cobra-snake-widesscreen-wallpapers-free-snakes-background-images.jpg', 500, 'This serpent is the world''s longest venomous snake. Adult king cobras are 3.18 to 4 m (10.4 to 13.1 ft) long.', 'Cobra', 50),
		(3, 'Grass snake (Natrix natrix)', 'http://freenatureimages.eu/Animals/Reptilia,%20Reptielen,%20Reptiles/Natrix%20tesselata,%20Dice%20Snake/Natrix%20tesselata%207,%20Saxifraga-Edo%20van%20Uchelen.jpg', 450, 'The grass snake is typically dark green or brown in colour with a characteristic yellow collar behind the head, which explains the alternative name ringed snake', 'Grass Snake', 10),
		(4, 'Dwarf crocodile (Osteolaemus tetraspis)', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Yacare_Caiman_(Caiman_yacare)_(28779955571).jpg/1200px-Yacare_Caiman_(Caiman_yacare)_(28779955571).jpg', 800, 'The dwarf crocodile (Osteolaemus tetraspis), also known commonly as the African dwarf crocodile, broad-snouted crocodile, or bony crocodile, is an African crocodile that is also the smallest extant crocodile species.', 'Crocodile', 20),
		(5, 'Slender-snouted crocodile (Mecistops cataphractus)', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Crocodylus_cataphractus.jpg/1200px-Crocodylus_cataphractus.jpg',1000, 'Slender-snouted crocodiles are native to freshwater habitats in central and western Africa. They are medium-sized crocodiles, typically slightly smaller than the Nile crocodile, but are larger than several other species of crocodilians.', 'Crocodile',2),
		(6, 'Freshwater crocodile (Crocodylus johnsoni)', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Indian_Gharial_Crocodile_Digon3.JPG/1200px-Indian_Gharial_Crocodile_Digon3.JPG', 900, 'The freshwater crocodile is a relatively small crocodilian. Males can grow to 2.3–3 m (7.5–9.8 ft) long, while females reach a maximum size of 2.1 m (6.9 ft).', 'Fresh water Crocodile', 80),
		(7, 'Leopard (Panthera pardus)', 'http://upload.wikimedia.org/wikipedia/commons/c/c9/Flickr_-_Rainbirder_-_Sassy_Lassy.jpg', 400, 'Compared to other members of Felidae, the leopard has relatively short legs and a long body with a large skull.', 'Leopard', 10),
		(8, 'Cougar (Puma concolor)', 'https://i1.wp.com/www.onegreenplanet.org/wp-content/uploads/2017/02/panther.jpg?fit=1200,800', 450, 'The cougar is an ambush predator and pursues a wide variety of prey. Primary food sources are ungulates, particularly deer, but also livestock. It also hunts species as small as insects and rodents.', 'Cougar', 1),
		(9, 'Cheetah (Acinonyx jubatus)', 'https://stories.sandisk.com/assets/images/orig/0150-Cheetahs.jpg', 300,'Cheetahs are active mainly during the day, with hunting their major activity. Adult males are sociable despite their territoriality, forming groups called ''coalitions''.', 'Cheetah', 30),
		(10, 'Redback spider (Latrodectus hasseltii)', 'https://media.buzzle.com/media/images-en/gallery/arthropods/spiders/1200-509673472-black-widow-spider.jpg', 100, 'Mainly nocturnal, the female redback lives in an untidy web in a warm sheltered location, commonly near or inside human residences. It preys on insects, spiders and small vertebrates that become ensnared in its web.', 'Spider', 14),
		(11, 'Goliath birdeater (Theraphosa blondi)', 'https://s3.amazonaws.com/plugpolo/poloup/up/a/a29/a2963030d4dd4a03a8fb95519887ab9b/img1.jpg', 120, 'The goliath birdeater is native to the upland rain forest regions of northern South America: Suriname, Guyana, French Guiana, northern Brazil and southern Venezuela.', 'Tarantula', 12),
		(12, 'Antilles pinktoe tarantula (Caribena versicolor)', 'http://www.mikebasictarantula.com/Avicularia_versicolor__2_.JPG', 300, 'Spiderlings of C. versicolor are bright blue, with a black tree trunk pattern on the abdomen. As they grow, they gradually lose their blue coloration; the carapace turns green, the abdomen red, and the legs turn green with pink tarsi and a covering of purple hairs.', 'Tarantula', 7)
)
AS Source(Id, ProductName, ProductImage, BaseCost, Description, Type, Stocked)
ON Target.Id = Source.Id
WHEN NOT MATCHED BY TARGET THEN
INSERT (ProductName, ProductImage, BaseCost, Description, Type, Stocked)
VALUES (ProductName, ProductImage, BaseCost, Description, Type, Stocked);

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

/*Set up the Staff*/
MERGE INTO Staff AS Target
USING (VALUES 
		(1, 'Kyle', 'Harvey', 9), 
		(2, 'General', 'Any', 10) 
)
AS Source(Id, FirstName, LastName, AccountId)
ON Target.Id = Source.Id
WHEN NOT MATCHED BY TARGET THEN
INSERT (FirstName, LastName, AccountId)
VALUES (FirstName, LastName, AccountId);