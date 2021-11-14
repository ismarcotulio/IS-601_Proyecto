CREATE SCHEMA HUMAN_R;
GO

CREATE TABLE HUMAN_R.AREA(
  tin_area_id_PK TINYINT PRIMARY KEY,
  var_name VARCHAR(60) NOT NULL,
  UNIQUE(var_name)
); 

CREATE TABLE HUMAN_R.POSITION(
  tin_position_id_PK TINYINT  PRIMARY KEY,
  var_name VARCHAR(60) NOT NULL,
  UNIQUE(var_name)
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
  int_country_id_PK INTEGER PRIMARY KEY,
  var_name VARCHAR(60) NOT NULL,
  var_code VARCHAR(6) NOT NULL,
  unique(var_code),unique(var_name)
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
  big_suburn_id_PK BIGINT PRIMARY KEY,
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
  big_suburn_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.SUBURN(big_suburn_id_PK)
);

CREATE TABLE HUMAN_R.PERSON(
  big_person_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY,
  var_firstName VARCHAR(60) NOT NULL,
  var_secondName VARCHAR(60) NOT NULL,
  var_firstSurname VARCHAR(60) NOT NULL,
  var_secondSurname VARCHAR(60) NOT NULL,
  var_DNI VARCHAR(13) NOT NULL,
  dat_dateOfBirth DATE,
  big_address_id_FK BIGINT REFERENCES HUMAN_R.LIST_ADDRESS(big_address_id_PK),
  cha_gender CHAR NOT NULL,
  CHECK((cha_gender='M' OR cha_gender='m') or (cha_gender='F' OR cha_gender='f'))
);
go

CREATE TABLE HUMAN_R.CLIENT(
	big_client_id_PK BIGINT PRIMARY KEY,
	var_code VARCHAR(20),
	var_RTN_Personal VARCHAR(14) NOT NULL,
	UNIQUE (var_code)
);

CREATE TABLE HUMAN_R.CLIENT_COMPANY(
	int_company_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY,
	var_name VARCHAR(150) NOT NULL,
	big_id_address_FK BIGINT NOT NULL REFERENCES HUMAN_R.LIST_ADDRESS(big_address_id_PK),
	big_client_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.CLIENT(big_client_id_PK)
);

CREATE TABLE HUMAN_R.CLIENT_PERSON(
	big_clientPerson_id_PK BIGINT PRIMARY KEY,
	big_person_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.PERSON(big_person_id_PK),
	big_client_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.CLIENT(big_client_id_PK)
);

CREATE TABLE HUMAN_R.CONTRACTS(
  int_contract_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY,
  dat_hiringDate DATE NOT NULL,
  bit_active BIT NOT NULL,
  mon_salary MONEY NOT NULL,
  tin_position_id_FK TINYINT NOT NULL REFERENCES HUMAN_R.POSITION(tin_position_id_PK)
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

CREATE TABLE HUMAN_R.TELEPHONES_TYPE(
	tin_telephonType_id_PK TINYINT PRIMARY KEY,
	var_name VARCHAR(50) NOT NULL
);

CREATE TABLE HUMAN_R.TELEPHONES(
	big_telephon_id_PK BIGINT PRIMARY KEY,
	var_number VARCHAR(12) NOT NULL,
	tin_telephonType_id_FK TINYINT NOT NULL REFERENCES HUMAN_R.TELEPHONES_TYPE(tin_telephonType_id_PK),
	int_country_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.COUNTRY(int_country_id_PK),
	UNIQUE (var_number,int_country_id_FK)
);

CREATE TABLE HUMAN_R.TELEPHONES_PERSON(
	bit_active BIT NOT NULL,
	big_person_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.PERSON(big_person_id_PK) ON DELETE CASCADE ON UPDATE CASCADE,
	big_telephon_id_FK BIGINT REFERENCES HUMAN_R.TELEPHONES(big_telephon_id_PK),
	PRIMARY KEY (big_telephon_id_FK,big_person_id_FK)
);

CREATE TABLE HUMAN_R.TELEPHONES_COMPANY(
	bit_active BIT NOT NULL,
	big_telephon_id_FK BIGINT REFERENCES HUMAN_R.TELEPHONES(big_telephon_id_PK),
	int_company_id_FK INTEGER REFERENCES HUMAN_R.CLIENT_COMPANY(int_company_id_PK),
	PRIMARY KEY (big_telephon_id_FK,int_company_id_FK)
);


