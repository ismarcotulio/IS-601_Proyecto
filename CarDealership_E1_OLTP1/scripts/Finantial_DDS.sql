CREATE DATABASE CarDealership_OLTP1;

USE CarDealership_OLTP1;

CREATE SCHEMA FINANTIAL;
GO

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
	FOREIGN KEY (tin_document_type_FK) REFERENCES [CarDealership_OLTP1].[FINANTIAL].[DOCUMENT_TYPE](int_id_PK),
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
	FOREIGN KEY (int_employees_FK) REFERENCES [CarDealership_OLTP1].[HUMAN_R].[EMPLOYEES](int_id_PK),
);

CREATE TABLE [CarDealership_OLTP1].[FINANTIAL].[SALE_DETAIL](
  big_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY,
  mon_price MONEY NOT NULL,
  mon_exempt_value MONEY NOT NULL,
  mon_total MONEY NOT NULL,
  int_vehicle_FK INT NOT NULL,
  big_sale_FK BIGINT NOT NULL,
  FOREIGN KEY (int_vehicle_FK) REFERENCES [CarDealership_OLTP1].[LOGISTIC].[VEHICLE](int_id_PK),
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
  FOREIGN KEY (tin_branch_FK) REFERENCES [CarDealership_OLTP1].[HUMAN_R].[BRANCH_OFFICES](tin_id_PK),
	FOREIGN KEY (big_person_FK) REFERENCES [CarDealership_OLTP1].[HUMAN_R].[PERSON](big_id_PK),
);

CREATE TABLE [CarDealership_OLTP1].[FINANTIAL].[PAYMENT_METHOD](
  tin_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY,
  mon_amount MONEY NOT NULL,
  tin_type_of_method_FK TINYINT NOT NULL,
  big_invoice_FK BIGINT NOT NULL,
  FOREIGN KEY (tin_type_of_method_FK) REFERENCES [CarDealership_OLTP1].[FINANTIAL].[TYPE_OF_METHODS](tin_id_PK),
	FOREIGN KEY (big_invoice_FK) REFERENCES [CarDealership_OLTP1].[FINANTIAL].[INVOICE](big_id_PK),
);
