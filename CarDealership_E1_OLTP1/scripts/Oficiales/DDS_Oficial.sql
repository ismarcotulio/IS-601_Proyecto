

CREATE DATABASE CarDealership_OLTP1
GO

USE CarDealership_OLTP1
GO

CREATE SCHEMA HUMAN_R;
GO

CREATE SCHEMA LOGISTIC
GO

CREATE SCHEMA FINANTIAL
GO

CREATE TABLE HUMAN_R.AREA(
  tin_area_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY,
  var_name VARCHAR(60) NOT NULL
); 

CREATE TABLE HUMAN_R.POSITION(
  tin_position_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY,
  var_name VARCHAR(60) NOT NULL
);

CREATE TABLE HUMAN_R.TYPE_HOURS(
  tin_hourType_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY,
  flo_porcent float NOT NULL,
  var_name VARCHAR(60) NOT NULL,
  CHECK (flo_porcent > 0)
);

CREATE TABLE HUMAN_R.MOVEMENT(
  int_movement_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY,
  tex_description TEXT NOT NULL,
  int_factor  INTEGER NOT NULL,
  mon_amount MONEY NOT NULL,
  CHECK (int_factor=-1 OR int_factor=1)
);

CREATE TABLE HUMAN_R.COUNTRY(
  int_country_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY,
  var_name VARCHAR(60) NOT NULL,
  var_code VARCHAR(6) NOT NULL,
);

CREATE TABLE HUMAN_R.DEPARTAMENT(
  big_departament_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY,
  var_name VARCHAR(60) NOT NULL,
  int_country_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.COUNTRY(int_country_id_PK),
  CONSTRAINT [DEPARTAMENT_Unique] UNIQUE NONCLUSTERED ([var_name] ASC, [big_departament_id_PK] ASC)
);

CREATE TABLE HUMAN_R.CITIES(
  big_city_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY,
  var_name VARCHAR(60) NOT NULL,
  big_departament_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.DEPARTAMENT(big_departament_id_PK),
  CONSTRAINT [cities_Unique] UNIQUE NONCLUSTERED ([var_name] ASC, [big_city_id_PK] ASC)
);

CREATE TABLE HUMAN_R.SUBURN(
  big_suburn_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY,
  var_name VARCHAR(60) NOT NULL,
  big_city_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.CITIES(big_city_id_PK),
  CONSTRAINT [SUBURN_Unique] UNIQUE NONCLUSTERED ([var_name] ASC, [big_city_id_FK] ASC)
);

CREATE TABLE HUMAN_R.LIST_ADDRESS(
  big_address_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY,
  tex_reference TEXT NOT NULL,
  int_country_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.COUNTRY(int_country_id_PK),
  big_departament_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.DEPARTAMENT(big_departament_id_PK),
  big_city_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.CITIES(big_city_id_PK),
  big_suburn_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.SUBURN(big_suburn_id_PK),
);

CREATE TABLE HUMAN_R.PERSON(
  big_person_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY,
  var_firstName VARCHAR(60) NOT NULL,
  var_secondName VARCHAR(60) NOT NULL,
  var_firstSurname VARCHAR(60) NOT NULL,
  var_secondSurname VARCHAR(60) NOT NULL,
  var_DNI VARCHAR(13) NOT NULL,
  var_RTN_Personal VARCHAR(14) NOT NULL,
  dat_dateOfBirth DATE,
  big_address_id_FK BIGINT REFERENCES HUMAN_R.LIST_ADDRESS(big_address_id_PK),
  cha_gender CHAR NOT NULL,
  CHECK((cha_gender='M' OR cha_gender='m') or (cha_gender='F' OR cha_gender='f'))
);
go

CREATE TABLE HUMAN_R.CONTRACTS(
  int_contract_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY,
  dat_hiringDate DATE NOT NULL,
  bit_active BIT NOT NULL,
  mon_salary MONEY NOT NULL,
  tin_position_id_FK TINYINT NOT NULL REFERENCES HUMAN_R.POSITION(tin_position_id_PK),
);

CREATE TABLE HUMAN_R.SALARY(
  int_salary_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY,
  mon_netSalary MONEY NOT NULL,
  mon_hourSalary MONEY NOT NULL,
  dat_date DATE NOT NULL,
  tin_area_id_FK TINYINT NOT NULL REFERENCES HUMAN_R.AREA(tin_area_id_PK),
  CHECK (mon_netSalary > 0)
);

CREATE TABLE HUMAN_R.PAYMENT_MOVEMENT(
  bit_motionFactor BIT NOT NULL,
  int_movement_id_PK_FK INTEGER NOT NULL REFERENCES HUMAN_R.MOVEMENT(int_movement_id_PK),
  int_salary_id_PK_FK INTEGER NOT NULL REFERENCES HUMAN_R.SALARY(int_salary_id_PK),
  PRIMARY KEY (int_movement_id_PK_FK,int_salary_id_PK_FK)
);

CREATE TABLE HUMAN_R.EXTRA_HOURS(
  big_extra_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY,
  dat_date DATE NOT NULL,
  tin_amount TINYINT NOT NULL,
  bit_payFactor BIT NOT NULL,
  tin_hourType_id_FK TINYINT NOT NULL REFERENCES HUMAN_R.TYPE_HOURS(tin_hourType_id_PK) ON DELETE CASCADE ON UPDATE CASCADE,
  int_salary_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.SALARY(int_salary_id_PK),
  CHECK (tin_amount > 0)
);

CREATE TABLE HUMAN_R.BRANCH_OFFICES(
  tin_id_branch_PK TINYINT PRIMARY KEY,
  var_name VARCHAR(50) NOT NULL,
  big_id_address_FK BIGINT NOT NULL REFERENCES HUMAN_R.LIST_ADDRESS(big_address_id_PK),
  FOREIGN KEY(big_id_address_FK) REFERENCES HUMAN_R.LIST_ADDRESS(big_address_id_PK)
);

CREATE TABLE HUMAN_R.EMPLOYEES(
  int_employee_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY,
  var_code VARCHAR(10) NOT NULL,
  tin_branch_id_FK TINYINT REFERENCES HUMAN_R.BRANCH_OFFICES(tin_id_branch_PK),
  big_person_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.PERSON(big_person_id_PK) ON DELETE CASCADE ON UPDATE CASCADE,
  int_contract_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.CONTRACTS(int_contract_id_PK),
  tin_area_id_FK TINYINT NOT NULL REFERENCES HUMAN_R.AREA(tin_area_id_PK),
  CONSTRAINT EMPLOYEES_CODE_unique UNIQUE(var_code),
  CONSTRAINT EMPLOYEES_PERSON_unique UNIQUE(big_person_id_FK),
);

CREATE TABLE HUMAN_R.SALARY_EMP(
	bit_pay BIT NOT NULL,
	int_salary_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.SALARY(int_salary_id_PK),
	int_employee_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.EMPLOYEES(int_employee_id_PK),
	PRIMARY KEY(int_salary_id_FK,int_employee_id_FK),
);

CREATE TABLE HUMAN_R.TELEPHONES(
	big_telephon_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY,
	var_number VARCHAR(12) NOT NULL,
	big_person_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.PERSON(big_person_id_PK),
	int_country_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.COUNTRY(int_country_id_PK),
);


IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'COLOR')
	CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[COLOR] (
		 tin_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL UNIQUE
	 );
	 
 
 IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'TYPE_MOVEMENT')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[TYPE_MOVEMENT](
		 tin_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL UNIQUE,
		 tex_description TEXT DEFAULT ''
	 );


IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'MANUFACTURER')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[MANUFACTURER](
		 int_id_PK INT PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
		 var_commonName VARCHAR(50) DEFAULT '',
		 var_postalCode VARCHAR(50) DEFAULT '',
		 tin_location_FK TINYINT DEFAULT 0
	 );


IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'BRAND')
	CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[BRAND](
		 int_id_PK INT PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL UNIQUE,
		 tex_description TEXT DEFAULT '',
		 int_manufacturer_FK INT NOT NULL, 
		 CONSTRAINT int_manufacturer_FK1 FOREIGN KEY (int_manufacturer_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[MANUFACTURER](int_id_PK)
	);


IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'BODY_CLASS')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[BODY_CLASS](
		 int_id_PK INT PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
		 tex_description TEXT DEFAULT ''
 );

 IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'VEHICLE_TYPE')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[VEHICLE_TYPE](
		 int_id_PK INT PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
		 tex_description TEXT DEFAULT ''
 );

 IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'FUEL_TYPE')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[FUEL_TYPE](
		 tin_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
		 tex_description TEXT DEFAULT ''
 );


IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'MODEL')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[MODEL](
		 big_id_PK BIGINT PRIMARY KEY NOT NULL,
		 var_name VARCHAR(50) NOT NULL,
		 tex_description TEXT DEFAULT '',
		 int_brand_FK INT NOT NULL, 
		 int_body_class_FK INT NOT NULL, 
		 CONSTRAINT int_brand_FK1 FOREIGN KEY (int_brand_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[BRAND](int_id_PK),
		 CONSTRAINT int_body_class_FK1 FOREIGN KEY (int_body_class_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[BODY_CLASS](int_id_PK)
 );


 IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'VEHICLE')
	 CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[VEHICLE](
		  big_id_PK BIGINT PRIMARY KEY NOT NULL,
		  dec_base_price DECIMAL(10,3) DEFAULT 0,
		  var_vin VARCHAR(45) NOT NULL UNIQUE,
		  var_engine VARCHAR(100) DEFAULT '',
		  var_brake_system VARCHAR(50) DEFAULT '',
		  tin_number_cylinders TINYINT DEFAULT 4,
		  dec_displacement_cc DECIMAL(10,3) DEFAULT 0,
		  var_gvwr VARCHAR(100) DEFAULT 0,
		  bit_use_state BIT DEFAULT 1,
		  tex_description TEXT DEFAULT '',
		  var_series VARCHAR(50) DEFAULT '',
		  int_year INT DEFAULT 2021,
		  tin_doors TINYINT DEFAULT 4,
		  tin_color_FK TINYINT NOT NULL,
		  big_model_FK BIGINT NOT NULL,
		  tin_fuel_type_FK TINYINT NOT NULL,
		  int_vehicle_type_FK INT NOT NULL, 
		  CONSTRAINT int_vehicle_type_FK1 FOREIGN KEY (int_vehicle_type_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[VEHICLE_TYPE](int_id_PK),
		  CONSTRAINT tin_color_FK1 FOREIGN KEY (tin_color_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[COLOR](tin_id_PK),
		  CONSTRAINT big_model_FK1 FOREIGN KEY (big_model_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[MODEL](big_id_PK),
		  CONSTRAINT tin_fuel_type_FK1 FOREIGN KEY (tin_fuel_type_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[FUEL_TYPE](tin_id_PK)
	  );
   
   
   IF NOT EXISTS (SELECT * FROM [CarDealership_OLTP1].sys.tables t JOIN [CarDealership_OLTP1].sys.schemas s ON (t.schema_id = s.schema_id) where s.name = 'LOGISTIC' and t.name = 'MOVEMENT')
	   CREATE TABLE [CarDealership_OLTP1].[LOGISTIC].[MOVEMENT](
		  tin_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		  dat_dueDateTime DATETIME NOT NULL,
		  tin_type_movement_FK TINYINT, 
		  tin_branch_FK TINYINT,
		  big_vehicle_FK BIGINT,
		  CONSTRAINT tin_type_movement_FK1 FOREIGN KEY(tin_type_movement_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[TYPE_MOVEMENT](tin_id_PK),
		  CONSTRAINT tin_branch_FK1 FOREIGN KEY (tin_branch_FK) REFERENCES [CarDealership_OLTP1].[HUMAN_R].[BRANCH_OFFICES](tin_id_branch_PK),
		  CONSTRAINT big_vehicle_FK1 FOREIGN KEY(big_vehicle_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[VEHICLE](big_id_PK)
	  );

CREATE TABLE [CarDealership_OLTP1].[FINANTIAL].[DOCUMENT_TYPE](
  tin_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY,
  int_number INT,
  var_code VARCHAR(10),
  var_name VARCHAR(60),
); 

CREATE TABLE [CarDealership_OLTP1].[FINANTIAL].[PRINTING](
  int_id_PK INT IDENTITY(1,1) PRIMARY KEY,
  var_code VARCHAR(10),
  tin_authorization_number TINYINT,
);

CREATE TABLE [CarDealership_OLTP1].[FINANTIAL].[TYPE_OF_METHODS](
  tin_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY,
  var_name VARCHAR(60),
); 

CREATE TABLE [CarDealership_OLTP1].[FINANTIAL].[RANK](
  big_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY,
  big_starting_range BIGINT,
  big_final_range BIGINT,
  bit_active BIT,
  tin_document_type_FK TINYINT NOT NULL, 
	FOREIGN KEY (tin_document_type_FK) REFERENCES [CarDealership_OLTP1].[FINANTIAL].[DOCUMENT_TYPE](tin_id_PK),
);

CREATE TABLE [CarDealership_OLTP1].[FINANTIAL].[INVOICE_NUMBER](
  big_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY,
  var_emission_point VARCHAR(60),
  int_correlative_number INT,
  int_printing_FK INT NOT NULL,
  tin_document_type_FK TINYINT NOT NULL, 
	FOREIGN KEY (int_printing_FK) REFERENCES [CarDealership_OLTP1].[FINANTIAL].[PRINTING](int_id_PK),
  FOREIGN KEY (tin_document_type_FK) REFERENCES [CarDealership_OLTP1].[FINANTIAL].[DOCUMENT_TYPE](tin_id_PK),
); 

CREATE TABLE [CarDealership_OLTP1].[FINANTIAL].[SALE](
  big_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY,
  dat_date_of_issue DATE,
  mon_subtotal MONEY NOT NULL,
  tin_discount TINYINT,
  mon_reduction MONEY,
  big_final_range BIGINT,
  mon_ISV_15 MONEY NOT NULL,
  mon_ISV_18 MONEY NOT NULL,
  mon_total_to_pay MONEY NOT NULL,
  int_employees_FK INT NOT NULL, 
	FOREIGN KEY (int_employees_FK) REFERENCES [CarDealership_OLTP1].[HUMAN_R].[EMPLOYEES](int_employee_id_PK),
);

CREATE TABLE [CarDealership_OLTP1].[FINANTIAL].[SALE_DETAIL](
  big_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY,
  mon_price MONEY NOT NULL,
  mon_exempt_value MONEY NOT NULL,
  mon_total MONEY NOT NULL,
  big_vehicle_FK BIGINT NOT NULL,
  big_sale_FK BIGINT NOT NULL,
  FOREIGN KEY (big_vehicle_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[VEHICLE](big_id_PK),
	FOREIGN KEY (big_sale_FK) REFERENCES [CarDealership_OLTP1].[FINANTIAL].[SALE](big_id_PK),
);

CREATE TABLE [CarDealership_OLTP1].[FINANTIAL].[INVOICE](
  big_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY,
  var_CAI VARCHAR(10) NOT NULL,
  dat_deadline DATE,
  big_invoice_number_FK BIGINT NOT NULL,
  big_sale_FK BIGINT NOT NULL,
  tin_branch_FK TINYINT NOT NULL,
  big_person_FK BIGINT NOT NULL,
  FOREIGN KEY (big_invoice_number_FK) REFERENCES [CarDealership_OLTP1].[FINANTIAL].[INVOICE_NUMBER](big_id_PK),
	FOREIGN KEY (big_sale_FK) REFERENCES [CarDealership_OLTP1].[FINANTIAL].[SALE](big_id_PK),
  FOREIGN KEY (tin_branch_FK) REFERENCES [CarDealership_OLTP1].[HUMAN_R].[BRANCH_OFFICES](tin_id_branch_PK),
	FOREIGN KEY (big_person_FK) REFERENCES [CarDealership_OLTP1].[HUMAN_R].[PERSON](big_person_id_PK),
);

CREATE TABLE [CarDealership_OLTP1].[FINANTIAL].[PAYMENT_METHOD](
  tin_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY,
  mon_amount MONEY NOT NULL,
  tin_type_of_method_FK TINYINT NOT NULL,
  big_invoice_FK BIGINT NOT NULL,
  FOREIGN KEY (tin_type_of_method_FK) REFERENCES [CarDealership_OLTP1].[FINANTIAL].[TYPE_OF_METHODS](tin_id_PK),
	FOREIGN KEY (big_invoice_FK) REFERENCES [CarDealership_OLTP1].[FINANTIAL].[INVOICE](big_id_PK),
);
