

INSERT INTO [CarDealership_OLTP1].[LOGISTIC].[COLOR] (var_name) VALUES 
	('black'), ('gray'), ('gold'), ('red'), ('blue'), ('green'), ('brown'), ('purple'), ('white'), ('yellow'), ('orange'), ('cyan'), ('pink'), ('silver'), ('beige')
;

INSERT INTO [CarDealership_OLTP1].[LOGISTIC].[TYPE_MOVEMENT] (var_name, tex_description) VALUES 
	('transfer', 'When a car leaves the premises; Either because it was sold or because it was transferred to another branch'),
	('arrival', 'When the car arrives at a branch')
;

INSERT INTO [CarDealership_OLTP1].[LOGISTIC].[MANUFACTURER] (int_id_PK, var_name, var_commonName, tin_location_FK) VALUES 
	(1, 'Volkswagen AG', 'Volkswagen Group', 1),
	(2, 'Daimler Motor Company', 'Daimler AG', 1),
	(3, 'Bayerische Motoren', 'BMW Group', 1),
	(4, 'Stellantis N.V', 'Stellantis.', 1),
	(5, 'Groupe Renault', 'Renault S.A', 1),
	(6, 'Ferrari S.p.A', 'Ferrari', 1),
	(7, 'Fiat Chrysler Automobiles', 'Fiat Chrysler Automobiles', 1),
	(8, 'General Motors Company', 'GM', 1),
	(9, 'Ford Motor Company', 'Ford', 1),
	(10, 'TOYOTA MOTOR MANUFACTURING, TEXAS, INC.', 'Toyota', 1),
	(11, 'MAZDA MOTOR CORPORATION', 'Mazda', 1),
	(12, 'FCA US LLC', 'FCA', 1)
;

INSERT INTO [CarDealership_OLTP1].[LOGISTIC].[BRAND] (int_id_PK, var_name, tex_description, int_manufacturer_FK) VALUES 
	(1, 'volkswagen', 'Volkswagen is the flagship brand for the Volkswagen Group and is considered to be one of the most reliable brands on the global market.', 1), 
	(2, 'mercedes-benz', 'Mercedes is one of the biggest producers of luxury cars in the world and they offer models in all body shapes and styles as well as with a range of electric and hybrid powertrains in line with the wider market’s shift to electric models.', 2), 
	(3, 'audi', 'Audi is renowned for its technological developments and driver-orientated interior that is finished to a high quality above what you expect even from a premium brand.', 1), 
	(4, 'bmw', 'BMW, or to give it its full name Bayerische Motoren Werke, began life in 1913 as the Rapp Motorenwerke GmbH which was a manufacturer of aircraft and motor vehicles.', 3), 
	(5, 'porsche', 'Ferdinand Porsche earlier for his part in designing of the VW Beetle but following on from that he went on to set up his own automotive company that focused on high-performance models that let him fully explore his interest in motor racing and the cars involved.', 1), 
	(6, 'peugeot', 'Peugeot is one of the oldest vehicle companies in the world if you base it on when the business was first opened which was in 1810. However, it didn’t begin life as a car manufacturer, in fact in 1810 the company was a steel foundry producing coffee grinders, band saws and umbrella frames.',4), 
	(7, 'renault', 'Renault was founded nearly a 125 years ago in 1898 by three brothers, Fernand, Marcel and Louis Renault.',5), 
	(8, 'citroen', 'DS started life as a model range within the Citroën brand but has now evolved into its own brand entirely. But given their intwined history and continued close relationship with shared technology, design and production we’re going to cover them both together.', 4), 
	(9, 'bugatti', 'Italian-born French automobile designer and manufacturer Ettore Bugatti set up his own company, Automobiles E. Bugatti, in 1909 in the city of Molsheim which is in the present-day Alsace region of France.', 1), 
	(10, 'alpine', 'In 1955 after some success in rallying Jean Rédélé, who had previously been the youngest Renault dealer in the country, decided to set up his own company and so Alpine came into existence. The name was chosen as a nod towards his racing success and the roads that he won on.', 5), 
	(11, 'ferrari', 'The brand was founded in 1939 by Enzo Ferrari and their racing team soon became the one to beat, setting itself apart from the crowd for its racing prowess. Since then, Ferrari has continued to achieve racing success and maintains a racing team to this day.', 6), 
	(12, 'lamborghini', 'Another one of the most notable sports car manufacturers that just happens to be an export from Italy as well is Lamborghini. And in fact it started life in 1963 with Ferruccio Lamborghini’s desire to rival the sports cars of Ferrari that were dominating the market, and the races, at the time.', 1), 
	(13, 'maserati', 'In 1914 Maserati was founded by the Maserati brothers, Bindo, Alfiero, Ettore and Ernesto. These four found their love of motor vehicles thanks to their oldest brother Carlo’s development of a combustion engine for motorised bicycles that he then raced with.', 7),
	(14, 'fiat', 'Fiat remains the largest industrial organisation in Italy and partnered with American car giant Chrysler in 2014 to create the Fiat Chrysler group and just under a year ago this company merged with PSA group to form a new company Stellantis which owns fourteen major brands including Fiat, Peugeot, Dodge, Jeep and more.', 7),  
	(15, 'alfa romeo', 'The company was founded in 1910 by Alexandre Darracq but was originally just named ALFA which was an acronym for Anonima Lombarda Fabbrica Automobili. When Nicola Romeo became the shareholder in 1915 he added his own surname to the business and Alfa Romeo was born.', 4),
	(16, 'chevrolet', 'Chevrolet Division of General Motors Company, is an American automobile division of the American manufacturer General Motors (GM).', 8), 
	(17, 'jeep', 'Jeep is an automobile marque originating in the United States, now owned by European conglomerate Stellantis.', 7), 
	(18, 'cadillac', 'The Cadillac Motor Car Division /ˈkædɪlæk/ is a division of the American automobile manufacturer General Motors Company (GM) that designs and builds luxury vehicles. Its major markets are the United States, Canada, and China.', 8),
	(19, 'ford', 'Ford Motor Company is an automobile company that designs, manufactures, markets, and services a full line of Ford trucks, utility vehicles, cars as well as Lincoln luxury vehicles. The Company operates in three segments: Automotive, Mobility and Ford Credit.', 9),  
	(20, 'dodge', 'Dodge is an American brand of automobiles and a division of Stellantis, based in Auburn Hills, Michigan.', 7),
	(21, 'gmc', 'GMC is a division of the American automobile manufacturer General Motors (GM) that primarily focuses on trucks and utility vehicles.', 8),
	(22, 'toyota', 'Toyota is the world s leader in sales of hybrid electric vehicles, one of the largest companies to encourage the mass-market adoption of hybrid vehicles across the globe, and the first to commercially mass-produce and sell such vehicles, with the introduction of the Toyota Prius in 1997.', 10),
	(23, 'mazda', 'The Mazda Motor Company is well-known for crafting a “fun-to-drive” personality into its vehicles, whether it be a sports car, sedan, or SUV. It constructs its vehicles using lightweight materials and economical engine technology to bolster fuel economy.', 11),
	(24, 'ram', 'Ram Trucks, stylized as RAM and formally known as the Ram Truck Division (of Chrysler), is an American brand of light to mid-weight commercial vehicles, and a division of Stellantis (previously Fiat Chrysler Automobiles)', 12)
;

INSERT INTO [CarDealership_OLTP1].[LOGISTIC].[BODY_CLASS] (int_id_PK, var_name, tex_description) VALUES 
	(1, 'Sedan', 'A sedan has four doors and a traditional trunk. Like vehicles in many categories, they are available in a range of sizes from small (subcompact vehicles like Nissan Versa and Kia Rio) to compacts (Honda Civic, Toyota Corolla) to mid-size (Honda Accord, Nissan Altima), and full-size (Toyota Avalon, Dodge Charger).'),
	(2, 'Coupe', 'A coupe has historically been considered a two-door car with a trunk and a solid roof. This would include cars like a Ford Mustang or Audi A5—or even two-seat sports cars like the Chevrolet Corvette and Porsche Boxster.'),
	(3, 'Sport Car', 'These are the sportiest, hottest, coolest-looking coupes and convertibles—low to the ground, sleek, and often expensive. They generally are two-seaters, but sometimes have small rear seats as well.'),
	(4, 'Station Wagon', 'Wagons are similar to sedans but have an extended roofline and a hatch door at the rear instead of a trunk. Some, like the Subaru Outback or Audi A4 Allroad, have elevated ground clearance and some rugged body cladding to make them more like a sport-utility vehicle (SUV), but they are nonetheless closely related to sedans. '),
	(5, 'Hatchback', 'Traditionally, the term "hatchback" has meant a compact or subcompact sedan with a squared-off roof and a rear flip-up hatch door that provides access to the vehicle s cargo area instead of a conventional trunk.'),
	(6, 'Convertible', 'Does the roof retract into the body leaving the passenger cabin open to the elements? If so, it is a convertible. Most convertibles have a fully powered fabric roof that folds down, but a few have to be lowered by hand. '),
	(7, 'SUV', 'SUVs—often also referred to as crossovers—tend to be taller and boxier than sedans, offer an elevated seating position, and have more ground clearance than a car. They include a station wagon-like cargo area that is accessed through a flip-up rear hatch door, and many offer all-wheel drive.'),
	(8, 'Minivan', 'Minivans are the workhorses of the family-car world, the best at carrying people and cargo in an efficient package. They are called minivans but they are far from mini. That is because they are tall boxes-on-wheels with sliding side doors for easy access and a rear hatch that opens to a large cargo area.'),
	(9, 'Pickup', 'A pickup truck has a passenger cab and an open cargo bed in the rear. Virtually all pickups offer some form of all-wheel drive or part-time four-wheel drive—the latter for off-road use only.'),
	(10, 'Supermini car', 'Subcompact car is an American classification for cars which is broadly equivalent to the B-segment (Europe) or supermini (Great Britain) classifications, and smaller than a compact car.'),
	(11, 'Electric', 'An electric car or battery electric car is an automobile that is propelled by one or more electric motors, using energy stored in batteries. Compared to internal combustion engine (ICE) vehicles, electric cars are quieter, have no exhaust emissions, and lower emissions overall.')
;

INSERT INTO [CarDealership_OLTP1].[LOGISTIC].[FUEL_TYPE] (var_name, tex_description) VALUES 
	('Gasoline', 'Gasoline (/ˈɡæsəliːn/) or petrol (/ˈpɛtrəl/) is a transparent, petroleum-derived flammable liquid that is used primarily as a fuel in most spark-ignited internal combustion engines.'),
	('Flexible Fuel Vehicle (FFV)', 'Flexible fuel vehicles (FFVs) have an internal combustion engine and are capable of operating on gasoline and any blend of gasoline and ethanol up to 83%.')
;

INSERT INTO [CarDealership_OLTP1].[LOGISTIC].[VEHICLE_TYPE] (int_id_PK, var_name, tex_description) VALUES 
	(1, 'Truck', 'A truck or lorry is a motor vehicle designed to transport cargo, carry specialized payloads, or perform other utilitarian work.'),
	(2, 'Passenger Car', 'A passenger car is a road motor vehicle, other than a motor cycle, intended for the carriage of passengers and designed to seat no more than nine persons (including the driver).'),
	(3, 'Multipurpose Passenger Vehicle', 'Multipurpose passenger vehicle means a motor vehicle with motive power, except a low-speed vehicle or trailer, designed to carry 10 persons or less')
;

INSERT INTO [CarDealership_OLTP1].[LOGISTIC].[MODEL] (big_id_PK, var_name, tex_description, int_brand_FK, int_body_class_FK) VALUES 
	(1, 'Arteon', 'The Arteon is eye-catching from any angle, with its elongated contours and low, aerodynamic silhouette. The wrap-around bonnet and frameless side windows exude quality and elegance, reflecting the style of a classic fastback saloon, beautifully complemented by the striking rear design.', 1, 5),
	(2, 'Beetle', 'The original Beetle was launched in 1938 and was known simply as ‘the Volkswagen’, quickly acquiring a raft of nicknames from across the world. Whatever the name, its popularity has never been in question.', 1, 6),
	(3, 'Beetle Cabriolet', 'The Beetle Cabriolet is the latest chapter in a unique automotive story that started with the original Beetle Convertible in 1949.', 1, 6),
	(4, 'Eos', 'Slotting into the range between our Golf and Passat models in terms of size, the Eos continued a long-running tradition of convertibles from Volkswagen which started with the Beetle over 50 years ago. Eos combined the benefits of a full convertible and - when the sun didnt shine - a hard-top coupé.', 1, 3),
	(5, 'Golf', 'Few cars have a history like that of the Volkswagen Golf. With global sales of over 30 million, in its seventh generation and having celebrated its 40th anniversary in March 2014, the Golf continues to offer customers a car which sets the benchmark in terms of comfort, practicality, safety and performance.', 1, 3),
	(6, 'A-Class', 'A is for athletic: Turbo power, seven speeds, four drive modes, and three suspension options. The A 220 and all-wheel-drive A 220 4MATIC turn 188 hp and 221 lb-ft of torque into full-time fun.', 2, 1),
	(7, 'S-Class', 'With a new S-Class, the sun rises on a new era for the automobile. More thoughtful of its passengers. More in tune with its driver. More protective of those within or even near its elegant presence. Everything that matters most to you, matters more than ever to the S-Class', 2, 1),
	(8, 'C-Class', 'The C-Class wraps technological advances in seductive style. Sleek sculpting, a wide range of wheel choices, and all-LED lighting highlight its athletically elegant body and acclaimed cabin.', 2, 1),
	(9, 'E-Class', 'You can talk to it, and the E-Class responds with action. It can talk with some other cars to help you prepare for trouble. And it can team up its advances to help make every drive safer, smoother, and more satisfying.', 2, 1),
	(10, 'GLA SUV', 'More than a commanding view of the road ahead, the new second-generation GLA offers a rewarding view of what is next. It not only puts more sport in compact SUVs, it puts more you.', 2, 7),
	(11, 'Q3', 'The Audi Q3 has 1 Diesel Engine and 1 Petrol Engine on offer. The Diesel engine is 1968 cc while the Petrol engine is 1395 cc . It is available with Automatic transmission.Depending upon the variant and fuel type the Q3 has a mileage of 15.17 to 18.51 kmpl & Ground clearance of Q3 is 170mm.', 3, 7),
	(12, 'Q4 e-tron', 'The Audi Q4 e-tron® is the first Audi model to feature an available augmented reality head-up display. Providing real-time vehicle information in your line of sight, the intuitive virtual display seamlessly blends innovative tech into your driving experience.', 3, 7),
	(13, 'Q5', 'The 2022 Q5 features a standard 261-hp turbocharged four-cylinder, a seven-speed automatic transmission, and Quattro all-wheel drive. The turbo four provides plenty of punch to scoot the Q5 around town or blast down a highway on-ramp, and it is smooth, quiet, and mellifluous.', 3, 7),
	(14, 'Q7', ' The Audi Q7 comes with a smooth-shifting eight-speed automatic transmission and either a turbocharged four-cylinder or a turbocharged V6 engine. The 2.0-liter turbo-four makes 248 horsepower and 273 pound-feet of torque.', 3, 7),
	(15, 'Q8', 'The Audi Q8 combines the elegance of a four-door luxury coupé with the versatility of an SUV.', 3, 7),
	(16, 'X5', 'The BMW X5 is a mid-size luxury crossover SUV produced by BMW.[1] The made its debut in 1998 as the E53 model. It was BMW is first SUV and it also featured all-wheel drive and was available with either manual or automatic transmission.', 4, 7),
	(17, 'X7', 'The 2021 BMW X7 is a seven-passenger, three-row SUV that is available in two trim levels: xDrive40i and M50i. The xDrive40i is powered by a turbocharged 3.0-liter inline-six cylinder engine, paired with a 48-volt mild hybrid system. Total output is 335 horsepower and 330 lb-ft of torque.', 4, 7),
	(18, '2 Series Gran', 'The BMW 2 Series Gran Coupe is a four-door coupe with a fine interior and a great infotainment system. Space in the back is average, though, and it looks a bit awkward', 4, 2),
	(19, 'X4 M', 'Power is provided by a turbocharged 3.0-liter inline-six engine, which sends 473 horses to all four wheels via an eight-speed automatic transmission. The exterior features LED headlights and taillights, 20-inch double-spoke bi-color orbit grey wheels, a power moonroof, and roof rails.', 4, 7),
	(20, 'X6 M', 'Gifted with the same raucous engine that powers the BMW M5 sedan, the X6 M is motivated by a twin-turbo 4.4-liter V-8. It makes 600 horsepower and 553 pound-feet of torque in its natural state and 617 ponies with the Competition package.', 4, 1),
	(21, '718 Cayman', 'Featuring the horizontally opposed layout made famous by Porsche, the standard engine that powers the 718 Cayman is a 2.0L turbocharged boxer 4-cylinder producing a balanced 300 horsepower.', 5, 3),
	(22, '718 Boxter', 'Drivers can choose between two exceptional turbocharged 4-cylinder engines that deliver 300 and 350 horsepower respectively and instantaneous acceleration. Rocketing from 0-60 in a Porsche 718 Boxster S takes as little as 4.4 seconds', 5, 3),
	(23, '718 Cayman T', 'Porsche is 718 Cayman T is a pumped-up and more enthralling base model. It is a brilliant car to drive with a naturally aspirated flat six-cylinder engine, head-of-the-class dynamics and seriously good looks', 5, 3),
	(24, '718 Boxter T', 'The 2020 Porsche 718 Boxster T uses the 2.0-liter, turbocharged flat-four that also motivates the base Boxster. The mid-mounted growler develops the same 300 horsepower and 280 lb-ft of torque, and it mates to Porsche is seven-speed PDK dual-clutch automatic or six-speed manual gearbox', 5, 3),
	(25, '718 Cayman S', 'Powered by a 2.5L turbocharged boxer 4 engine, the new 718 Cayman S Convertible summons a formidable 350 hp and 309 lb-ft of torque. Paired with the standard 6-speed manual transmission, the 718 Cayman S shoots from 0 to 60 mph in just 4.4 seconds.', 5, 3),
	(26, '208', 'The Peugeot 208 is a supermini car (B-segment in Europe) produced by the PSA Group, later Stellantis. It was unveiled at the Geneva Motor Show in March 2012', 6, 10),
	(27, '508', 'The Peugeot 508 is a mid-size/large family car produced by the French automaker Peugeot, and followed by the 508 SW, an estate version, in March 2011.', 6, 5),
	(28, 'Traveller', 'The Peugeot Traveller is a large van-based MPV with up to nine seats, but running costs comparable to a regular car.', 6, 8),
	(29, 'suv 3008', 'The Peugeot 3008 is a front-running crossover that offers a spacious, upmarket cabin and plenty of kit. After hedging its bets with the crossover/MPV looks of the Mk1, the current Peugeot 3008 is a genuine front-runner in the crossover class.', 6, 7),
	(30, 'expert', 'Peugeot introduced the electric e-Expert to the range in 2020. This features the same running gear found in cars such as the Peugeot e-2008, so there is a 134bhp electric motor and 50kWh battery for a range of 148 miles, plus the option of a larger 75kWh version for a WLTP-certified driving range of 211 miles', 6, 8),
	(31, 'Clio', 'The Renault Clio is a supermini car (B-segment), produced by French automobile manufacturer Renault.', 7, 5),
	(32, 'Zoe-Tech Electric', 'Zoe E-Tech electric range gives you a simple choice between two electric motors; R110 (on Play and Iconic models only) and a larger R135 motor available throughout the range. The R135 model packs 135hp, and delivers a smooth driving experience with effortless torque, fast acceleration and instant responsiveness.', 7, 11),
	(33, 'Captur', 'The Renault Captur is a series of subcompact crossover SUVs manufactured by the French automaker Renault. The production version of the first one, based on the B platform, made its debut at the 2013 Geneva Motor Show and started to be marketed in France during April 2013.', 7, 7),
	(34, 'Megane Sport Tourer', 'new Megane Sport Tourer is all about versatility with its E-Tech plug-in hybrid technology, combining a 1.6 L petrol engine and two electric motors. For everyday driving, make the most of the electric mode start and enjoy a silent, comfortable drive with unparalleled responsiveness (up to 40 miles(1) in full electric mode). Planning to head off on holiday? Set out on long journeys without having to worry about driving range.', 7, 3),
	(35, 'Trafic Passenger', 'With seating for up to nine people, the all-new Trafic Passenger is a practical, convenient and reliable vehicle complete with dynamic styling and technology enhanced safety. Ideal for large families or business use, the Trafic Passenger can be configured to your travel needs thanks to a variety of seating options.', 7, 8),
	(36, 'C3 Aircross', 'The Citroen C3 Aircross offers relaxed cruising ability and promising fuel efficiency from a strong range of petrol and diesel engines. Ride comfort is decent, too, while the distinctive interior has lots of kit and useful family-friendly touches, made all the more practical following a mid-life refresh in 2021.', 8, 7),
	(37, 'C4 Cactus', 'The C4 Cactus is considered a compact SUV, although it is based on the PSA PF1 platform that underpins the smaller Citroën C3 and DS3', 8, 7),
	(38, 'C3', 'The Citroën C3 is a supermini car (B-segment) produced by Citroën since April 2002. It replaced the Citroën Saxo in the model line up, and is currently in its third generation. The third generation model made its appearance in June 2016, and went on sale in January 2017.', 8, 5),
	(39, 'Berlingo', 'MPVs like the Citroën Berlingo were the Multi Purpose Vehicles before SUVs started getting in on the act, and still provide a solution for almost every practical eventuality.', 8, 7),
	(40, 'Grand C4 Picasso', 'The Citroen Grand C4 Picasso is the perfect choice for growing families, thanks to its spacious interior, impressive comfort and useful storage options. It also has big windows that create a bright and airy atmosphere', 8, 7),
	(41, 'Centodieci', 'The Bugatti Centodieci (Italian for "110") is a limited production mid-engine sports car produced by French automotive manufacturer Bugatti.', 9, 3),
	(42, 'La VoiTure Noire', 'The new La Voiture Noire packs 1,500 horsepower and 1,180 pound-foot of torque that propels it from 0 to 60 mph in 2.5 seconds. It has a quad turbo W-16 engine with a top speed of 261 mph', 9, 3),
	(43, 'Divo', 'The Bugatti Divo is a mid-engine track-focused sports car developed and manufactured by Bugatti Automobiles S.A.S. The car is named after French racing driver Albert Divo, who raced for Bugatti in the 1920s winning the Targa Florio race twice.', 9, 3),
	(44, 'Bolide', 'The Bolide — a name that comes from French slang for "very fast car," according to Bugatti — was designed solely for track driving, not for use on public roads. It has a modified version of the huge 8.0-liter, 16-cylinder engine found in Bugatti is Chiron, the brand s core model', 9, 3),
	(45, 'Chiron Super Sport', 'The Chiron Super Sport 300+ model is arguably the wildest and most extravagant in the range. Equipped with an 8.0-litre 16-cylinder engine rated at 1,577 horsepower, it can reach a top speed of 489 km/h. In fact, Bugatti set a record by becoming the first automaker to top 300 miles per hour.', 9, 3),
	(46, 'M63', 'The Alpine M63 was the first racing car from Alpine and was developed in 1962', 10, 3),
	(47, 'M64', 'Founded by Jean Redele, Alpine was a small French manufacturer of lightweight sports cars, race cars and rally cars. The M64 was an evolution of the M63 prototype from the previous year. A mid-engine spaceframe design similar to that of the Lotus 23, the M64 was powered by a 1049cc Renault Gordini four-cylinder engine.', 10, 3),
	(48, 'M65', 'Founded by Jean Redele, Alpine was a small French manufacturer of lightweight sports cars, race cars and rally cars. The M64 was an evolution of the M63 prototype from the previous year. A mid-engine spaceframe design similar to that of the Lotus 23, the M65 was powered by a 1049cc Renault Gordini four-cylinder engine.', 10, 3),
	(49, 'A210', 'The Alpine A210 was a sports car prototype manufactured by Alpine that competed in sports car racing from 1966 to 1969. The car derived from the M series prototypes (M63, M64, and M65) introduced by the company in the early 1960s and powered by Gordini-tuned Renault engines with small displacements.', 10, 3),
	(50, 'A220', 'The first A220 started its career in the season of 1968 (24 Hours of Le Mans), but proved to be unreliable and weak, even with its 310 hp. The car evolved in 1969, mainly in terms of ground clearance – which was reduced – and its bodywork, in order to accommodate a V8! However, its power remained identical.', 10, 3),
	(51, 'F430', 'he Ferrari F430 (Type F131) is a sports car produced by the Italian automobile manufacturer Ferrari from 2004 to 2009 as a successor to the Ferrari 360.', 11, 3),
	(52, '360 GTC', 'The Ferrari 360 GTC has been developed to replace the previous 360 GT. With a kerb weight of 1,100 kg (2,425 lb) (with ballast), it was built since 2004 by Ferrari Corse Clienti department in collaboration with Michelotto Automobili to compete in the N-GT class.', 11, 3),
	(53, '612 Scaglietti', 'The 612 Scaglietti shares its engine with the 575 Superamerica - despite the name s suggestion that it is a six-litre V12 the displacement is actually 5,748 cc (5.7 L).', 11, 3),
	(54, 'F430 Spider', 'The F430 Spider is powered by Ferrari s new 490 hp, 4,308cc 90Â° V8 which is capable of pushing the car to a top speed of over 310 km/h (over 193 mph) and covering the 0-100 km/h (0-62 mph) sprint in just 4.1 seconds.', 11, 3),
	(55, 'Superamerica', 'The Ferrari Superamerica combines stunning Ferrari 12-cylinder berlinetta performance with a highly original, innovative take on the ever-versatile convertible. The Superamerica is also the very first production car to adopt an innovative rotating roof incorporating electrochromic technology developed exclusively for large glass surfaces, which transforms it from a coupé to a convertible in just a few seconds.The result is a car that combines all of the prestige and allure of a drop-top with the functional advantages of a coupé. ', 11, 6),
	(56, 'Aventador', 'The Lamborghini Aventador (Spanish pronunciation: [aβentaˈðoɾ]) is a mid-engine super car produced by the Italian automotive manufacturer Lamborghini. In keeping with Lamborghini tradition, the Aventador is named after a Spanish fighting bull in Zaragoza, Aragón in 1993.', 12, 3),
	(57, 'Huracan', 'The Lamborghini Huracán (Spanish for "hurricane"; [uɾaˈkan]) is a sports car manufactured by Italian automotive manufacturer Lamborghini replacing the previous V10 offering, the Gallardo', 12, 3),
	(58, 'Urus', 'Lamborghini Urus is the first Super Sport Utility Vehicle in the world to merge the soul of a super sports car with the functionality of an SUV. Powered by a 4.0-liter twin-turbo V8 engine producing 650 CV and 850 Nm of torque, Urus accelerates from 0 to 62 mph in 3.6 seconds and reaches a top speed of 190 mph', 12, 3),
	(59, 'Terzo Millennio', 'the terzo millennio aims to combine technology and self-healing, the cars ability to conduct its own health monitoring to detect cracks and damages. this is conducted through micro channels filled with healing chemistries. the energy storage system directly relates to performance.', 12, 3),
	(60, 'Asterion', 'The car features a torque vectoring system, a system typical on hybrid sports cars. The Asterion has a top speed of 298 km/h (185 mph) which reduces to 125 km/h (78 mph) when running solely on electric power', 12, 3),
	(61, 'Ghibli', 'The first remains the most revered, and was designed to compete with the Lamborghini Miura and Ferrari 365 GTB/4 Daytona. Powered first by a 4.7 and then a 4.9-litre V8, it remains one of Maserati s greatest ever road cars. The second Ghibli was based on the unloved Biturbo platform.', 13, 3),
	(62, 'Levante', 'The Maserati Levante (Tipo M161) is a mid-size luxury crossover SUV based on the Kubang concept car that debuted at the 2011 Frankfurt Auto Show, and built by Maserati at the Mirafiori factory in Turin, Italy starting in 2016.', 13, 7),
	(63, 'Quattroporte', 'The Maserati Quattroporte (Italian pronunciation: [ˌkwatroˈpɔrte]) is a four-door full-size luxury sports saloon produced by Italian automobile manufacturer Maserati. The name translated from Italian means "four doors". The car is currently in its sixth generation, with the first generation introduced in 1963.', 13, 1),
	(64, 'MC20', 'The Maserati MC20 (Maserati Corse 2020) is an upcoming two-seater, mid-engined sports car that will be produced by Italian car manufacturer Maserati and was originally scheduled to debut in May 2020.', 13, 3),
	(65, 'Alfieri', 'The Maserati Alfieri is a grand tourer from the Italian car manufacturer Maserati.', 13, 3),
	(66, 'Tipo SW', 'With 0 to 100 km/h (62mph) in 9.8 seconds, a maximum top speed of 124 mph (200 km/h), a curb weight of 2822 lbs (1280 kgs), the Tipo SW 1.4 T-Jet 16v has a turbocharged Inline 4 cylinder engine, Petrol motor.', 14, 4),
	(67, '124 Spider', 'The Fiat 124 Sport Spider is a convertible sports car marketed by Fiat for model years 1966-1985.', 14, 6),
	(68, 'Cubo', 'Qubo: the minivan with ultra-compact dimensions, original lines and incredible load capacity: an original and surprising car.', 14, 8),
	(69, 'Doblo', 'The Fiat Doblò is a panel van and leisure activity vehicle produced by Italian automaker Fiat since 2000. It was unveiled at the Paris Motor Show in October 2000', 14, 8),
	(70, 'Fullback', 'The Fiat Fullback is a pickup truck from the Italian automobile manufacturer Fiat made from 2016 to 2019', 14, 9),
	(71, 'Stelvio', 'The Alfa Romeo Stelvio (Tipo 949) is a compact luxury crossover SUV manufactured and marketed by the Alfa Romeo subdivision of Stellantis', 15, 7),
	(72, 'Giulia', 'The Giulia is the Italian brand s answer to the BMW 3 Series, Mercedes-Benz C-Class, Audi A4 and Jaguar XE – a mid-size saloon with an all-new rear-wheel drive platform (that also underpins the new Stelvio SUV) in which Alfa (or parent company FCA) invested billions in a quest to take Alfa from sales of 75,000 per year', 15, 7),
	(73, 'Stelvio Quadrifoglio', 'he Stelvio Quadrifoglio outshines even the world s most legendary sport sedans with heavy doses of speed, power, and style. Built to break barriers and expectations, one of the world s fastest production (remove hyphen) SUVs touts 505 horsepower and a top speed of 176 mph.', 15, 7),
	(74, 'Giulia Quadrifoglio', 'With its rhapsodic twin-turbo 2.9-liter V-6 and a well-calibrated eight-speed automatic transmission, the rear-drive-only Giulia Quadrifoglio is a riot to pilot. The Italian-built, Ferrari-derived engine produces 505 horsepower, 443 pound-feet of torque, and a spine-tingling timbre that shames most rivals.', 15, 7),
	(75, '4C Spider', 'Bred from Alfa Romeo race cars, the 4C Spiders boast razor-sharp handling and thrilling performance. Rocket from 0-60 in just 4.1 seconds with the 1.7L turbocharged 237 horsepower 4 cylinder engine', 15, 3),
	(76, 'Spark', 'The Chevrolet Spark (Korean: 쉐보레 스파크) is a city car manufactured by General Motors s subsidiary GM Korea, currently in its fourth generation', 16, 8),
	(77, 'Trailblazer', 'The 2022 Chevrolet Trailblazer is an extra-small SUV that s offered in four trim levels: LS, LT, Activ and RS. The base engine is a turbocharged 1.2-liter three-cylinder engine (137 horsepower, 162 lb-ft of torque) and it s paired with a continuously variable automatic transmission and front-wheel drive.', 16, 7),
	(78, 'Camaro', 'The Chevrolet Camaro is a mid-size American automobile manufactured by Chevrolet, classified as a pony car and also as a muscle car with some versions. It first went on sale on September 29, 1966, for the 1967 model year and was designed as a competing model to the Ford Mustang.', 16, 3),
	(79, 'Equinox', 'The 2021 Chevrolet Equinox comes in four trim levels: L, LS, LT, and Premier. A 1.5-liter turbocharged engine, a six-speed automatic transmission, and front-wheel drive are standard', 16, 7),
	(80, 'Silverado', 'The Chevrolet Silverado is a range of trucks manufactured by General Motors under the Chevrolet brand. Introduced for the 1999 model year, the Silverado is the successor to the long-running Chevrolet C/K model line.', 16, 9),
	(81, 'Grand Cherokee L', 'eep is expanding the 2021 Grand Cherokee lineup—literally and figuratively—with a new model that it is calling the Grand Cherokee L. It is larger than the existing version you are familiar with and includes a third row of seats that allows it to accommodate up to seven passengers.', 17, 7),
	(82, 'Wrangler 4xe', 'The Wrangler 4xe is a plug-in hybrid electric SUV that combines a powerful electric motor with a gas engine, which means that even when the Wrangler 4xe isnt charged, you can still drive using the gas engine', 17, 7),
	(83, 'Wrangler', 'The Jeep Wrangler is a series of compact and mid-size four-wheel drive off-road SUVs manufactured by Jeep since 1986, and currently in its fourth generation. ... From 2004 on, the Wrangler has been complemented with long-wheelbase versions, called Wrangler Unlimited.', 17, 7),
	(84, 'Grand Cherokee', 'The 2021 Jeep Grand Cherokee is a fine midsize SUV. It sports an upscale interior with comfy seats, an easy-to-use infotainment system, and decent space for adults in both rows.', 17, 7),
	(85, 'Compass', 'The Jeep Compass is a compact crossover SUV introduced for the 2007 model year, and is now in its second generation', 17, 7),
	(86, 'CT4', 'The Cadillac CT4 is a compact executive sedan manufactured and marketed by Cadillac. It replaced the Cadillac ATS sedan and sits below the CT5 in Cadillac s lineup. The CT4-V was unveiled first on May 30, 2019, followed by the standard CT4 four months later.', 18, 1),
	(87, 'CT4-V', 'The CT4-V Blackwing is 3.6L twin turbocharged V6 engine lets you ease down the throttle and revel in the rush of 472 hp and 445 lb. -ft. of torque', 18, 1),
	(88, 'CT5', 'The CT5 went on sale in the fall of 2019 and is available in four trim levels (Luxury, Premium Luxury, Sport, and V). The base model CT5 is powered by the 2.0 L LSY turbocharged I4 producing 237 hp (177 kW) at 5000 rpm and 258 lb⋅ft (350 N⋅m) of torque at 1500-4000 rpm.', 18, 1),
	(89, 'CT5-V', 'The CT5-V Blackwing is a sharp-handling sedan that also can be set to ride quite comfortably despite its sporting intentions. Standard magnetorheological dampers sense the road surface and your driving intention and adjust accordingly.', 18, 1),
	(90, 'CT5-V Blackwing', '6.2L Supercharged V8 engine with 668 hp† [498kW] and 659 lb-ft of torque† [893 N-m] 6-speed manual transmission (10-speed automatic transmission available) Latest-generation Magnetic Ride Control adaptive suspension. Brembo®† high-performance brakes.', 18, 1),
	(91, 'Bronco', 'The Ford Bronco is a model line of sport utility vehicles manufactured and marketed by Ford. The first SUV model developed by the company, five generations of the Bronco were sold from the 1966 to 1996 model years. A sixth generation of the model line is sold from the 2021 model year.', 19, 7),
	(92, 'Bronco Sport', 'Overview. The 2021 Ford Bronco Sport is the baby brother of the all-new, off-road-ready Bronco SUV, and a viable alternative to Jeep s smaller models. With a boxy design that s both cool and cute plus numerous innovative features, the Ford ute is poised to be popular', 19, 7),
	(93, 'Mustang MACH-E', 'Compared with the base model, the Mach-E Premium has more powerful fast-charging capability, 19-inch wheels, a Band & Olufsen sound system, a panoramic sunroof, and a power liftgate', 19, 7),
	(94, 'Ecosport', 'The Ford EcoSport (pronounced EE-koh-sport) is a subcompact crossover SUV, originally built in Brazil by Ford Brazil since 2003, at the Camaçari plant. A second generation concept model was launched in 2012, and is also assembled in new factories in India, Thailand, Russia and Romania.', 19, 7),
	(95, 'Edge', 'The 2021 Ford Edge has two powertrain choices. The Edge SE, SEL, ST-Line, and Titanium models are equipped with a 250-horsepower turbocharged four-cylinder engine, an eight-speed automatic transmission, and front-wheel drive; all-wheel drive is optional.', 19, 7),
	(96, 'Charger', 'The Charger is Dodge s big, bad sedan, a platform-mate to the more luxuriously oriented Chrysler 300 and the muscley four-door counterpart to the Dodge Challenger coupe. Dodge offers a generous smattering of six- and eight-cylinder engine options, plus your choice of RWD or AWD.', 20, 1),
	(97, 'Challenger', 'The Dodge Challenger R/T features a 5.7-liter Hemi V8 engine, a performance exhaust, and an upgraded rear axle. The Hemi is rated at 375 horsepower with a standard six-speed manual transmission, and it s 372 horsepower with an optional eight-speed automatic', 20, 3),
	(98, 'Durango', 'The high-performance model will deliver 710 horsepower and 645 pound-feet of torque when it goes into production next yea', 20, 7),
	(99, 'Neon', 'The Dodge Neon SXT is a GREAT car for the money. It runs very well, has a comfortable interior with plenty of leg room and has a radio that works well. I LOVE this car', 20, 1),
	(100, 'Attitude', 'The Dodge Attitude is a badge-engineered subcompact sedan sold by Stellantis North America (previously Fiat Chrysler Automobiles, Chrysler Group LLC, and Dodge', 20, 1),
	(101, 'Sierra', 'The full-size Sierra 1500 pickup truck is available in light-duty and heavy-duty forms and is GMC s bread and butter', 21, 9),	
	(102, 'Tundra', 'The Toyota Tundra features a 5.7-liter V8 engine that produces 381 horsepower and 401 pound-feet of torque. The Tundra has brisk acceleration and good power, but some rivals have more impressive engines, and most have a wider array of options to choose from.', 22, 9),
	(103, 'Colorado', 'The Chevrolet Colorado, and its counterpart, the GMC Canyon, are series of compact and later mid-sized pickup trucks marketed by American automaker General Motors. They were introduced in 2004 to replace the Chevrolet S-10 and GMC S-15/Sonoma compact pickups. It is named for the U.S. state of Colorado.', 16, 9),
	(104, 'Corvette', 'The Chevrolet Corvette, colloquially known as the Vette, is a two-door, two-passenger sports car manufactured and marketed by Chevrolet across more than 60 years of production and eight design generations. From 1953 to 2019, it was front-engined, and since 2020, it is mid-engined.', 16, 6),
	(105, 'Tacoma', 'The Toyota Tacoma is a midsize pickup truck offered in six trim levels: SR, SR5, TRD Sport, TRD Off-Road, Limited and TRD Pro. The SR and SR5 come standard with a 2.7-liter four-cylinder engine producing 159 horsepower and 180 lb-ft of torque.', 22, 9),
	(106, 'Ranger', 'The 2021 Ford Ranger is a midsize pickup truck that is offered as either an extended cab (SuperCab) with a 6-foot bed or a crew cab (SuperCrew) with a 5-foot bed. It is available in three trim levels: XL, XLT and Lariat.', 19, 9),
	(107, 'MX-5', 'The Mazda MX-5 is a lightweight two-passenger roadster sports car manufactured and marketed by Mazda with a front mid-engine, rear-wheel-drive layout. ... As the best-selling two-seat convertible sports car in history, the MX-5 has been marketed globally, with production exceeding one million, as of early 2016..', 22, 6),
	(108, 'XT4', 'The XT4 (short for "Crossover Touring 4") is Cadillac s second crossover SUV, slotting below the mid-size Cadillac XT5, serving as the luxury equivalent to the Chevrolet Equinox and GMC Terrain', 18, 7),
	(109, 'Renegade', 'The Jeep Renegade is a subcompact SUV with seating for up to five passengers. It comes in four trim levels: Sport, Latitude, Limited and Trailhawk. A turbocharged 1.3-liter four-cylinder engine (177 horsepower, 190 lb-ft of torque) and nine-speed transmission are standard on all trims.', 17, 7),
	(110,'F-150', 'Yes, the Ford F-150 is an excellent full-size pickup truck. It has a diverse lineup of potent powertrains, including V6, V8, and diesel engine options, as well as a brand-new hybrid. The F-150 has poised handling and a smooth ride, and none of its classmates can tow or haul as much.', 19, 9),
	(111,'1500', 'The Ram 1500 can tow up to 12,750 pounds and carry a payload of up to 2320 pounds. Its maximum towing capacity exceeds all but the Ford F-150, which currently exceeds 13,000 pounds', 24, 9)
;


INSERT INTO [CarDealership_OLTP1].[LOGISTIC].[VEHICLE] (
		big_id_PK,
		dec_base_price,
		var_brake_system,
		dec_displacement_cc,
		tin_doors,
		tin_number_cylinders,
		var_engine,
		tin_fuel_type_FK,
		var_gvwr,
		big_model_FK,
		int_year,
		var_series,
		var_vin,
		int_vehicle_type_FK,
		bit_use_state,
		tex_description,  
		tin_color_FK	  
) VALUES 
	(1, 30000, 'Hydraulic', 5300.0, 4, 8, 'L83 - VVT, AFM (Active Fuel Management), Aluminum', 1, 'Class 2E: 6,001 - 7,000 lb (2,722 - 3,175 kg)', 101, 2014, '1500 SLT', '3GTP1VEC4EG551563', 1, 1, '', 1),
	(2, 30000, 'Hydraulic', 5300.0, 4, 8, 'LMG', 2, 'Class 2E: 6,001 - 7,000 lb (2,722 - 3,175 kg)', 80, 2010, '1/2 Ton', '1GCSCSE06AZ123805', 1, 1, '', 2),
	(3, 30000, 'Hydraulic', 5300.0, 4, 8, 'L84 - DI, DFM, ALUM, GEN 5, VAR 2', 1, 'Class 2E: 6,001 - 7,000 lb (2,722 - 3,175 kg)', 80, 2020, '1500 LT', '3GCPWCED5LG130317', 1, 1, '', 3),
	(4, 31930.00,'Hydraulic', 4600.0, 4, 8, '1UR-FE', 1, 'Class 2E: 6,001 - 7,000 lb (2,722 - 3,175 kg)', 102, 2017, 'UPK51L/USK51L/USK52L/UPK56L/USK56L/USK57L', '5TFRM5F17HX120972', 1, 1, '', 4),
	(5, 30000, 'Hydraulic', 6000, 2, 8, 'L96', 1, 'Class 2H: 9,001 - 10,000 lb (4,082 - 4,536 kg)', 101, 2012, '2500', '1GT220CG8CZ231238', 1, 1, '', 4),
	(6, 30000,'Hydraulic', 4300.0, 4, 6, 'LV3 - SIDI, VVT, Aluminum, E85 Max.', 1, 'Class 2F: 7,001 - 8,000 lb (3,175 - 3,629 kg)', 80, 2016, '1500 LT', '1GCVKREH6GZ228691', 1, 1, '', 1),
	(7, 25000,'Hydraulic', 3600.0, 4, 6, 'LFX - SIDI, VVT, E85 MAX, Aluminum', 1, 'Class 1D: 5,001 - 6,000 lb (2,268 - 2,722 kg)', 103, 2016, 'LT', '1GCHTCE37G1186784', 1, 1, '', 2),
	(8, 25000,'Hydraulic', 6200.0, 2, 8, 'LS3', 1, '', 104, 2011, 'Grand Sport 2LT', '1G1YR3DW3B5102190', 2, 1, '', 5),
	(9, 27785.00,'Hydraulic', 4300.0, 2, 6, 'LV3 - GEN 5, SIDI, VVT: Variable Valve Timing, E85 MAX, ALUM', 1, 'Class 2E: 6,001 - 7,000 lb (2,722 - 3,175 kg)', 80, 2017, '1500', '1GCNCNEH7HZ118773', 1, 1, '', 1),
	(10, 26543, 'Hydraulic', 3600.0, 4, 6, 'LFX - SIDI, VVT, E85 MAX, Aluminum', 1, 'Class 1D: 5,001 - 6,000 lb (2,268 - 2,722 kg)', 103, 2016, 'Z71', '1GCGTDE32G1341288', 1, 1, '', 2), 
    (11, 65432, 'Hydraulic',2700.0, 4 , 8, '5VZFE ', 1, 'Clase 1:6000 lb o menos (2722 kg o menos)', 105, 2014, 'TRN225L / GRN225L', '5TFTX4CN3EX042751', 1,1 , '',1 ),
    (12, 74432,'Hydraulic',6200.0, 2 , 8, '6.2L (376 ci) V8 DI (455 hp [339.3 kW] a 6000 rpm, 455 l ', 1, '', 78, 2016, '1SS', '1G1FF1R79G0140582', 2, 1, '', 4),
    (13, 85421, 'Hydraulic',5700.0, 4 , 6, ' V8 de 5.7L y 32 V MPFI DOHC ', 1, 'Clase 2: 6,001 - 10,000 lb (2722 -4,536 kg)', 102,2014 , 'UPK51L/ GSK51L / USK51L', '5TFEY5F15EX169621',1 ,1 , '', 5),
    (14, 23654, 'Hydraulic',2300.0, 4 , 6, '', 1, 'Clase 2E: 6,001 - 7,000 lb (2,722 -3175 kg)',106 ,2019 , '', '1FTER4EH3KLA31326',3 , 1, '', 1),
	(15, 31835.00,'Hydraulic', 2000.0, 2 , 4, '', 1, '',107 ,2020 , '', 'JM1NDAC74L0413665',2 , 1, '', 4),
	(16, 31835.00,'Hydraulic', 2300.0, 2 , 4, '', 1, '',106 ,2020 , '', '1FTER1EH1LLA36301',1 , 1, '', 6),
	(17, 39795,'Hydraulic', 2000, 4 , 4, 'LSY - SIDI, VVT, ALUM, VAR 3', 1, 'Class 1D: 5,001 - 6,000 lb (2,268 - 2,722 kg)',108 ,2019 , 'Sport FWD', '1GYFZER40KF121673',3 , 1, '', 3),
	(18, 39995,'Hydraulic', 1400.0, 4 , 4, '', 1, 'Class 1C: 4,001 - 5,000 lb (1,814 - 2,268 kg)',109 ,2016 , '', 'ZACCJBAW9GPC62449',3 , 1, '', 7),
	(19, 39995,'Hydraulic', 2700.0, 4 , 6, '', 1, 'Class 2E: 6,001 - 7,000 lb (2,722 - 3,175 kg)',110 ,2016 , '', '1FTMF1CP3GKD62143',1 , 1, '', 7),
	(20, 39435,'Hydraulic', 4300.0, 2 , 6, 'LV3 - VVT, Aluminum, E85 Max', 1, '',101 ,2015 , '', '1GTN1TEH9FZ243281',1 , 1, '', 7),
	(21, 39435,'Hydraulic', 3600.0, 2 , 6, '', 1, 'Class 2E: 6,001 - 7,000 lb (2,722 - 3,175 kg)',111 ,2018 , 'ST', '1C6RR6FG0JS259587',1 , 1, '', 1),
	(22, 39435,'Hydraulic', 5300.0, 2 , 6, 'LMG - Flex Fuel (Gas/ALC), Cylinder Deactivation Iron', 2, 'Class 2E: 6,001 - 7,000 lb (2,722 - 3,175 kg)',101 ,2013 , '1500', '1GTR1WE07DZ143724',1 , 1, '', 1),
	(23, 39535,'Hydraulic', 5700.0, 2 , 8, '', 1, 'Class 2E: 6,001 - 7,000 lb (2,722 - 3,175 kg)',111 ,2019 , '1500', '3C6JR6DT3KG560649',1 , 1, '', 1),
	(24, 44690,'Hydraulic', 5000.0, 2 , 8, '5.0L 4V Premium Fuel', 1, '',93 ,2018 , 'GT Convertible', '1FATP8FF5J5115190',2 , 1, '', 4)
    --('Estandar ', 4000, 4 ,6 , 'V6 de 4.0L 24V MPFI DOHC  ',1 , 'Clase 1D: 5,001 -6,000 lb (2,268 -2722 kg)',1919 ,2018 , 'PRO 4X 4x4 4dr Crew Cab SWB ', '1N6AD0EV5JN745213', 3, 1, '', 6),
    --('Hydraulic ',3300.0, 4 , 6, ' Combustible flexible de 3.3L V6 24V PDI DOHC ', 1, 'Clase 2E: 6,001 - 7,000 lb (2,722 -3,175 kg)', 1801,2018 , '', '1FTEX1CBXJKD41626', 1, 2, '', 1),
    --('Hydraulic ',3500.0,  4, 6, ' PDI DOHC V6 de 3,5 L y 24 V ', 1, 'Clase 1D: 5,001 - 6,000 lb (2,268 -2,722 kg)',2223 ,2016 , 'GRN325L', '3TMAZ5CN7GM019182', 2, 1, '', 3),
    --('Estandar ',2000, 2 , 6, ' 2,0 litros ', 1, 'Clase 1C: 4,001 - 5000 lb (1,814 - 2268 kg)',1943 ,2020 , 'Deporte', '1C4GJXAN4LW180633',2 , 1, '',5 ),
    --('Hydraulic ',2700.0, 4,6 , ' V6 2.7L 24V PDI DOHC Twin Turbo ',1 , 'Clase 2E: 6,001 - 7,000 lb (2,722 -3175 kg)', 1801,2020 , '', '1FTEW1CP4LFB84170',2 , 3, '', 6),
    --('Estandar ',5700.0, 4 ,8 , ' 5.7L V8 16V MPFI OHV ', 1, 'Clase 2E: 6,001 - 7,000 lb (2,722 - 3,175 kg)', 13620,2017 , 'DS (Ruedas traseras simples)', '3C6JR6DT3HG557601', 1, 2, '', 3)
;

/*
SELECT * FROM [CarDealership_OLTP1].[LOGISTIC].[COLOR];
SELECT * FROM [CarDealership_OLTP1].[LOGISTIC].[MANUFACTURER];
SELECT * FROM [CarDealership_OLTP1].[LOGISTIC].[BRAND];
SELECT * FROM [CarDealership_OLTP1].[LOGISTIC].[TYPE_MOVEMENT];
SELECT * FROM [CarDealership_OLTP1].[LOGISTIC].[BODY_CLASS];
SELECT * FROM [CarDealership_OLTP1].[LOGISTIC].[MODEL];
*/

