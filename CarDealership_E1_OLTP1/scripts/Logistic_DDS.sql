CREATE DATABASE CAR_RENT_AND_SALE ;

USE CAR_RENT_AND_SALE;

CREATE SCHEMA LOGISTIC;
GO

CREATE SCHEMA HUMAN_R;
GO

CREATE TABLE LOGISTIC.COLOR (
 int_id_PK INT IDENTITY(1,100) PRIMARY KEY ,
 var_name VARCHAR(50),
 );

 CREATE TABLE LOGISTIC.BRAND(
 int_id_PK INT IDENTITY(1,100) PRIMARY KEY ,
 var_name VARCHAR(50),
 tex_description TEXT,
 );

 CREATE TABLE LOGISTIC.TYPE_MOVEMENT(
 tin_id_PK TINYINT PRIMARY KEY,
 var_name VARCHAR(50),
 tex_description TEXT,
 );


 CREATE TABLE LOGISTIC.MANUFACTER(
 big_id_PK BIGINT PRIMARY KEY,
 var_name VARCHAR(50),
 var_commonName VARCHAR(50),
 var_postalCode VARCHAR(50),
 int_brand_FK INT , FOREIGN KEY (int_brand_FK) REFERENCES LOGISTIC.COLOR(int_id_PK),
 tin_location_FK TINYINT,
 );

 CREATE TABLE LOGISTIC.MODEL(
 int_id_PK INT IDENTITY(1,100) PRIMARY KEY ,
 var_name VARCHAR(50),
 tex_description TEXT,
 big_manufacter_FK BIGINT, FOREIGN KEY (big_manufacter_FK) REFERENCES LOGISTIC.MANUFACTER(big_id_PK),
 );

 CREATE TABLE LOGISTIC.VEHICLE(
  big_id_PK BIGINT IDENTITY(1,100) PRIMARY KEY ,
  var_vin VARCHAR(45),
  int_kilometer INT ,
  tin_year_production TINYINT,
  var_motor VARCHAR(50),
  tin_number_cylinders TINYINT,
  bit_use_state BIT,
  tex_description TEXT,
  int_color_FK INT,
  int_model_FK INT,
  );

  CREATE TABLE HUMAN_R.BRANCH_OFFICES(
  tin_id_branch_PK TINYINT PRIMARY KEY,
  var_name VARCHAR(50),
  int_id_address_FK INT,
  );


  CREATE TABLE LOGISTIC.MOVEMENT(
  tin_id_PK TINYINT,
  dat_dueDateTime DATETIME,
  tin_type_movement_FK TINYINT, FOREIGN KEY(tin_type_movement_FK) REFERENCES LOGISTIC.TYPE_MOVEMENT(tin_id_PK),
  tin_branch_FK TINYINT, FOREIGN KEY (tin_branch_FK) REFERENCES HUMAN_R.BRANCH_OFFICES(tin_id_branch_PK),
  big_vehicle_FK BIGINT, FOREIGN KEY(big_vehicle_FK) REFERENCES LOGISTIC.VEHICLE(big_id_PK),
  );


 