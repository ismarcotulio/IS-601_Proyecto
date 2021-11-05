CREATE DATABASE CAR_RENT_AND_SALE ;
USE CAR_RENT_AND_SALE;

 CREATE TABLE MARKETING_DEPARTAMENT(
 tin_id_PK TINYINT PRIMARY KEY,
 var_name VARCHAR(50),
 tex_description TEXT,
 int_brand_FK INT , FOREIGN KEY (int_brand_FK) REFERENCES LOGISTIC.TYPE_MOVEMENT(tin_id_PK)
 );

 CREATE TABLE MARKETING_SOCIAL_NETWORKS(
 tin_id_PK TINYINT PRIMARY KEY,
 var_name VARCHAR(50),
 tex_description TEXT,
 tin_departament_FK TINYINT , FOREIGN KEY (tin_departament_FK) REFERENCES  MARKETING_DEPARTAMENT(tin_id_PK)
 );

 CREATE TABLE MARKETING_BRAND_MANAGEMENT(
 tin_id_PK TINYINT PRIMARY KEY,
 var_name VARCHAR(50),
 tex_description TEXT,
 tin_departament_FK TINYINT , FOREIGN KEY (tin_departament_FK) REFERENCES  MARKETING_DEPARTAMENT(tin_id_PK)
 );


 CREATE TABLE MARKETING_MARKET_STUDY(
 tin_id_PK TINYINT PRIMARY KEY,
 var_name VARCHAR(50),
 tex_description TEXT,
 tin_departament_FK TINYINT , FOREIGN KEY (tin_departament_FK) REFERENCES  MARKETING_DEPARTAMENT(tin_id_PK)
 );

 CREATE TABLE MARKETING_CAMPAIGN_ADVERTISING(
 tin_id_PK TINYINT PRIMARY KEY,
 var_name VARCHAR(50),
 tex_description TEXT,
 tin_departament_FK TINYINT , FOREIGN KEY (tin_departament_FK) REFERENCES  MARKETING_DEPARTAMENT(tin_id_PK)
 );

CREATE TABLE [MARKETING.PROMOTION] (
    [tin_area_id_PK] TINYINT      IDENTITY (1, 1) NOT NULL,
    [tex_description]       VARCHAR (60) NOT NULL,
	[tex_type]       VARCHAR (60) NOT NULL,
    PRIMARY KEY CLUSTERED ([tin_area_id_PK] ASC)
);

CREATE TABLE [MARKETING.SALE_PROMOTION] (
    [tin_area_id_PK] TINYINT      IDENTITY (1, 1) NOT NULL,
    [tex_description]       VARCHAR (60) NOT NULL,
	[date_start_date]       DATETIME,
	[date_start_final]		DATETIME,
    PRIMARY KEY CLUSTERED ([tin_area_id_PK] ASC)
);








