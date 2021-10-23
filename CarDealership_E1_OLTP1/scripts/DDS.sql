

IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'COLOR')
	CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[COLOR] (
		 int_id_PK INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
	 );
	 

IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'BRAND')
	CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[BRAND](
		 int_id_PK INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
		 tex_description TEXT DEFAULT ''
	);

 
 IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'TYPE_MOVEMENT')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[TYPE_MOVEMENT](
		 tin_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
		 tex_description TEXT DEFAULT ''
	 );


IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'MANUFACTER')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[MANUFACTER](
		 big_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
		 var_commonName VARCHAR(50) DEFAULT '',
		 var_postalCode VARCHAR(50) DEFAULT '',
		 int_brand_FK INT NOT NULL, FOREIGN KEY (int_brand_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[COLOR](int_id_PK),
		 tin_location_FK TINYINT DEFAULT 0,
	 );


IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'MODEL')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[MODEL](
		 int_id_PK INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
		 tex_description TEXT DEFAULT '',
		 big_manufacter_FK BIGINT NOT NULL, FOREIGN KEY (big_manufacter_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[MANUFACTER](big_id_PK),
 );


 IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'VEHICLE')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[VEHICLE](
		  big_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		  var_vin VARCHAR(45) NOT NULL,
		  int_kilometer INT DEFAULT 0,
		  tin_year_production TINYINT DEFAULT 2001,
		  var_motor VARCHAR(50) DEFAULT '',
		  tin_number_cylinders TINYINT DEFAULT 4,
		  bit_use_state BIT DEFAULT 1,
		  tex_description TEXT DEFAULT '',
		  int_color_FK INT NOT NULL,
		  int_model_FK INT NOT NULL,
		  FOREIGN KEY (int_color_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[COLOR](int_id_PK),
		  FOREIGN KEY (int_model_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[MODEL](int_id_PK)
	  );

   IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'HUMAN_R' and t.name = 'BRANCH_OFFICES')
	   CREATE TABLE [CarDealership_OLTP1].[HUMAN_R].[BRANCH_OFFICES](
		  tin_id_branch_PK TINYINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		  var_name VARCHAR(50) NOT NULL,
		  int_id_address_FK INT DEFAULT 0,
	  );
   
   
   IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'MOVEMENT')
	   CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[MOVEMENT](
		  tin_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		  dat_dueDateTime DATETIME NOT NULL,
		  tin_type_movement_FK TINYINT, FOREIGN KEY(tin_type_movement_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[TYPE_MOVEMENT](tin_id_PK),
		  tin_branch_FK TINYINT, FOREIGN KEY (tin_branch_FK) REFERENCES [CarDealership_OLTP1].[HUMAN_R].[BRANCH_OFFICES](tin_id_branch_PK),
		  big_vehicle_FK BIGINT, FOREIGN KEY(big_vehicle_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[VEHICLE](big_id_PK),
	  );

  


 


 