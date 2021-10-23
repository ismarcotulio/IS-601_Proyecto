

INSERT INTO [CarDealership_OLTP1].[LOGISTIC].[COLOR] (var_name) VALUES 
	('black'), ('gray'), ('gold'), ('red'), ('blue'), ('green'), ('brown'), ('purple'), ('white'), ('yellow'), ('orange'), ('cyan'), ('pink'), ('silver'), ('beige')
;

INSERT INTO [CarDealership_OLTP1].[LOGISTIC].[MANUFACTURER] (var_name, var_commonName, tin_location_FK) VALUES 
	('Volkswagen AG', 'Volkswagen Group', 1),
	('Daimler Motor Company', 'Daimler AG', 1),
	('Bayerische Motoren', 'BMW Group', 1),
	('Stellantis N.V', 'Stellantis.', 1),
	('Groupe Renault', 'Renault S.A', 1),
	('Ferrari S.p.A', 'Ferrari', 1),
	('Fiat Chrysler Automobiles', 'Fiat Chrysler Automobiles', 1),
	('General Motors Company', 'GM', 1),
	('Ford Motor Company', 'Ford', 1)
;

INSERT INTO [CarDealership_OLTP1].[LOGISTIC].[BRAND] (var_name, tex_description, int_manufacturer_FK) VALUES 
	('volkswagen', 'Volkswagen is the flagship brand for the Volkswagen Group and is considered to be one of the most reliable brands on the global market.', 1), 
	('mercedes-benz', 'Mercedes is one of the biggest producers of luxury cars in the world and they offer models in all body shapes and styles as well as with a range of electric and hybrid powertrains in line with the wider market’s shift to electric models.', 2), 
	('audi', 'Audi is renowned for its technological developments and driver-orientated interior that is finished to a high quality above what you expect even from a premium brand.', 1), 
	('bmw', 'BMW, or to give it its full name Bayerische Motoren Werke, began life in 1913 as the Rapp Motorenwerke GmbH which was a manufacturer of aircraft and motor vehicles.', 3), 
	('porsche', 'Ferdinand Porsche earlier for his part in designing of the VW Beetle but following on from that he went on to set up his own automotive company that focused on high-performance models that let him fully explore his interest in motor racing and the cars involved.', 1), 
	('peugeot', 'Peugeot is one of the oldest vehicle companies in the world if you base it on when the business was first opened which was in 1810. However, it didn’t begin life as a car manufacturer, in fact in 1810 the company was a steel foundry producing coffee grinders, band saws and umbrella frames.',4), 
	('renault', 'Renault was founded nearly a 125 years ago in 1898 by three brothers, Fernand, Marcel and Louis Renault.',5), 
	('citroen', 'DS started life as a model range within the Citroën brand but has now evolved into its own brand entirely. But given their intwined history and continued close relationship with shared technology, design and production we’re going to cover them both together.', 4), 
	('bugatti', 'Italian-born French automobile designer and manufacturer Ettore Bugatti set up his own company, Automobiles E. Bugatti, in 1909 in the city of Molsheim which is in the present-day Alsace region of France.', 1), 
	('alpine', 'In 1955 after some success in rallying Jean Rédélé, who had previously been the youngest Renault dealer in the country, decided to set up his own company and so Alpine came into existence. The name was chosen as a nod towards his racing success and the roads that he won on.', 5), 
	('ferrari', 'The brand was founded in 1939 by Enzo Ferrari and their racing team soon became the one to beat, setting itself apart from the crowd for its racing prowess. Since then, Ferrari has continued to achieve racing success and maintains a racing team to this day.', 6), 
	('lamborghini', 'Another one of the most notable sports car manufacturers that just happens to be an export from Italy as well is Lamborghini. And in fact it started life in 1963 with Ferruccio Lamborghini’s desire to rival the sports cars of Ferrari that were dominating the market, and the races, at the time.', 1), 
	('maserati', 'In 1914 Maserati was founded by the Maserati brothers, Bindo, Alfiero, Ettore and Ernesto. These four found their love of motor vehicles thanks to their oldest brother Carlo’s development of a combustion engine for motorised bicycles that he then raced with.', 7),
	('fiat', 'Fiat remains the largest industrial organisation in Italy and partnered with American car giant Chrysler in 2014 to create the Fiat Chrysler group and just under a year ago this company merged with PSA group to form a new company Stellantis which owns fourteen major brands including Fiat, Peugeot, Dodge, Jeep and more.', 7),  
	('alfa romeo', 'The company was founded in 1910 by Alexandre Darracq but was originally just named ALFA which was an acronym for Anonima Lombarda Fabbrica Automobili. When Nicola Romeo became the shareholder in 1915 he added his own surname to the business and Alfa Romeo was born.', 4),
	('chevrolet', 'Chevrolet Division of General Motors Company, is an American automobile division of the American manufacturer General Motors (GM).', 8), 
	('jeep', 'Jeep is an automobile marque originating in the United States, now owned by European conglomerate Stellantis.', 7), 
	('cadillac', 'The Cadillac Motor Car Division /ˈkædɪlæk/ is a division of the American automobile manufacturer General Motors Company (GM) that designs and builds luxury vehicles. Its major markets are the United States, Canada, and China.', 8),
	('ford', 'Ford Motor Company is an automobile company that designs, manufactures, markets, and services a full line of Ford trucks, utility vehicles, cars as well as Lincoln luxury vehicles. The Company operates in three segments: Automotive, Mobility and Ford Credit.', 9),  
	('dodge', 'Dodge is an American brand of automobiles and a division of Stellantis, based in Auburn Hills, Michigan.', 7)
;

INSERT INTO [CarDealership_OLTP1].[LOGISTIC].[TYPE_MOVEMENT] (var_name, tex_description) VALUES 
	('transfer', 'When a car leaves the premises; Either because it was sold or because it was transferred to another branch'),
	('arrival', 'When the car arrives at a branch')
;



SELECT * FROM [CarDealership_OLTP1].[LOGISTIC].[COLOR];
SELECT * FROM [CarDealership_OLTP1].[LOGISTIC].[MANUFACTURER];
SELECT * FROM [CarDealership_OLTP1].[LOGISTIC].[BRAND];
SELECT * FROM [CarDealership_OLTP1].[LOGISTIC].[TYPE_MOVEMENT];

