import {getConnection} from '../database/connection'

export const tableFuncionProceduresFill = async (req, res) => {
    const pool = await getConnection();
    
    //Tables
    await pool.request()
    .query("CREATE SCHEMA HUMAN_R");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.AREA(tin_area_id_PK TINYINT PRIMARY KEY, var_name VARCHAR(60) NOT NULL, UNIQUE(var_name))");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.POSITION(tin_position_id_PK TINYINT PRIMARY KEY,var_name VARCHAR(60) NOT NULL, unique(var_name))");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.TYPE_HOURS(tin_hourType_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY,flo_porcent float NOT NULL,var_name VARCHAR(60) NOT NULL,CHECK (flo_porcent > 0))");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.MOVEMENT(int_movement_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY,tex_description TEXT NOT NULL,int_factor  INTEGER NOT NULL,mon_amount MONEY NOT NULL,CHECK (int_factor=-1 OR int_factor=1))");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.COUNTRY( int_country_id_PK INTEGER PRIMARY KEY, var_name VARCHAR(60) NOT NULL, var_code VARCHAR(6) NOT NULL, unique(var_code),unique(var_name))");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.DEPARTAMENT( big_departament_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY, var_name VARCHAR(60) NOT NULL, int_country_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.COUNTRY(int_country_id_PK), CONSTRAINT [DEPARTAMENT_Unique] UNIQUE NONCLUSTERED ([var_name] ASC, [big_departament_id_PK] ASC) )");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.CITIES( big_city_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY, var_name VARCHAR(60) NOT NULL, big_departament_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.DEPARTAMENT(big_departament_id_PK), CONSTRAINT [cities_Unique] UNIQUE NONCLUSTERED ([var_name] ASC, [big_city_id_PK] ASC) )");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.SUBURN( big_suburn_id_PK BIGINT PRIMARY KEY, var_name VARCHAR(60) NOT NULL, big_city_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.CITIES(big_city_id_PK), CONSTRAINT [SUBURN_Unique] UNIQUE NONCLUSTERED ([var_name] ASC, [big_city_id_FK] ASC) )");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.LIST_ADDRESS( big_address_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY, tex_reference TEXT NOT NULL, int_country_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.COUNTRY(int_country_id_PK), big_departament_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.DEPARTAMENT(big_departament_id_PK), big_city_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.CITIES(big_city_id_PK), big_suburn_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.SUBURN(big_suburn_id_PK))");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.PERSON( big_person_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY, var_firstName VARCHAR(60) NOT NULL, var_secondName VARCHAR(60) NOT NULL, var_firstSurname VARCHAR(60) NOT NULL, var_secondSurname VARCHAR(60) NOT NULL, var_DNI VARCHAR(13) NOT NULL, dat_dateOfBirth DATE, big_address_id_FK BIGINT REFERENCES HUMAN_R.LIST_ADDRESS(big_address_id_PK), cha_gender CHAR NOT NULL, CHECK((cha_gender='M' OR cha_gender='m') or (cha_gender='F' OR cha_gender='f')) )");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.CLIENT( big_client_id_PK BIGINT PRIMARY KEY, var_code VARCHAR(20), var_RTN_Personal VARCHAR(14) NOT NULL, UNIQUE (var_code) );")
    await pool.request()
    .query("CREATE TABLE HUMAN_R.CLIENT_COMPANY( int_company_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY, var_name VARCHAR(150) NOT NULL, big_id_address_FK BIGINT NOT NULL REFERENCES HUMAN_R.LIST_ADDRESS(big_address_id_PK), big_client_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.CLIENT(big_client_id_PK) );")
    await pool.request()
    .query("CREATE TABLE HUMAN_R.CLIENT_PERSON( big_clientPerson_id_PK BIGINT PRIMARY KEY, big_person_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.PERSON(big_person_id_PK), big_client_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.CLIENT(big_client_id_PK) );")
    await pool.request()
    .query("CREATE TABLE HUMAN_R.CONTRACTS( int_contract_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY, dat_hiringDate DATE NOT NULL, bit_active BIT NOT NULL, mon_salary MONEY NOT NULL, tin_position_id_FK TINYINT NOT NULL REFERENCES HUMAN_R.POSITION(tin_position_id_PK))");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.SALARY( int_salary_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY, mon_netSalary MONEY NOT NULL, mon_hourSalary MONEY NOT NULL, dat_date DATE NOT NULL, tin_area_id_FK TINYINT NOT NULL REFERENCES HUMAN_R.AREA(tin_area_id_PK), CHECK (mon_netSalary > 0) )");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.PAYMENT_MOVEMENT( bit_motionFactor BIT NOT NULL, int_movement_id_PK_FK INTEGER NOT NULL REFERENCES HUMAN_R.MOVEMENT(int_movement_id_PK), int_salary_id_PK_FK INTEGER NOT NULL REFERENCES HUMAN_R.SALARY(int_salary_id_PK), PRIMARY KEY (int_movement_id_PK_FK,int_salary_id_PK_FK) )");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.EXTRA_HOURS( big_extra_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY, dat_date DATE NOT NULL, tin_amount TINYINT NOT NULL, bit_payFactor BIT NOT NULL, tin_hourType_id_FK TINYINT NOT NULL REFERENCES HUMAN_R.TYPE_HOURS(tin_hourType_id_PK) ON DELETE CASCADE ON UPDATE CASCADE, int_salary_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.SALARY(int_salary_id_PK), CHECK (tin_amount > 0) )");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.BRANCH_OFFICES( tin_id_branch_PK TINYINT PRIMARY KEY, var_name VARCHAR(50) NOT NULL, big_id_address_FK BIGINT NOT NULL REFERENCES HUMAN_R.LIST_ADDRESS(big_address_id_PK), FOREIGN KEY(big_id_address_FK) REFERENCES HUMAN_R.LIST_ADDRESS(big_address_id_PK) )");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.EMPLOYEES( int_employee_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY, var_code VARCHAR(10) NOT NULL, tin_branch_id_FK TINYINT REFERENCES HUMAN_R.BRANCH_OFFICES(tin_id_branch_PK), big_person_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.PERSON(big_person_id_PK) ON DELETE CASCADE ON UPDATE CASCADE, int_contract_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.CONTRACTS(int_contract_id_PK), tin_area_id_FK TINYINT NOT NULL REFERENCES HUMAN_R.AREA(tin_area_id_PK), CONSTRAINT EMPLOYEES_CODE_unique UNIQUE(var_code), CONSTRAINT EMPLOYEES_PERSON_unique UNIQUE(big_person_id_FK))");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.SALARY_EMP( bit_pay BIT NOT NULL, int_salary_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.SALARY(int_salary_id_PK), int_employee_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.EMPLOYEES(int_employee_id_PK), PRIMARY KEY(int_salary_id_FK,int_employee_id_FK))");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.TELEPHONES_TYPE( tin_telephonType_id_PK TINYINT PRIMARY KEY, var_name VARCHAR(50) NOT NULL )");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.TELEPHONES( big_telephon_id_PK BIGINT PRIMARY KEY, var_number VARCHAR(12) NOT NULL, tin_telephonType_id_FK TINYINT NOT NULL REFERENCES HUMAN_R.TELEPHONES_TYPE(tin_telephonType_id_PK), int_country_id_FK INTEGER NOT NULL REFERENCES HUMAN_R.COUNTRY(int_country_id_PK),UNIQUE (var_number,int_country_id_FK))");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.TELEPHONES_PERSON( bit_active BIT NOT NULL, big_person_id_FK BIGINT NOT NULL REFERENCES HUMAN_R.PERSON(big_person_id_PK) ON DELETE CASCADE ON UPDATE CASCADE, big_telephon_id_FK BIGINT REFERENCES HUMAN_R.TELEPHONES(big_telephon_id_PK), PRIMARY KEY (big_telephon_id_FK,big_person_id_FK));");
    await pool.request()
    .query("CREATE TABLE HUMAN_R.TELEPHONES_COMPANY( bit_active BIT NOT NULL, big_telephon_id_FK BIGINT REFERENCES HUMAN_R.TELEPHONES(big_telephon_id_PK), int_company_id_FK INTEGER REFERENCES HUMAN_R.CLIENT_COMPANY(int_company_id_PK), PRIMARY KEY (big_telephon_id_FK,int_company_id_FK) );");
    
    //Funcions and views

    await pool.request()
    .query("CREATE FUNCTION [dbo].[getRandomDate] ( @lower DATE, @upper DATE ) RETURNS DATE AS BEGIN DECLARE @random DATE SELECT @random = DATEADD(day, DATEDIFF(DAY, @lower, @upper) * seed, @lower) FROM dbo.seeder RETURN @random END");
    await pool.request()
    .query("CREATE VIEW seeder AS SELECT RAND(CONVERT(VARBINARY, NEWID())) seed")
    await pool.request()
    .query("CREATE VIEW vwRandom AS SELECT RAND() as Rnd")
    await pool.request()
    .query("CREATE FUNCTION fnCustomPass ( @size AS INT, @op AS VARCHAR(2) ) RETURNS VARCHAR(62) AS BEGIN DECLARE @chars AS VARCHAR(52), @numbers AS VARCHAR(10), @strChars AS VARCHAR(62), @strPass AS VARCHAR(62), @index AS INT, @cont AS INT SET @strPass = '' SET @strChars = '' SET @chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' SET @numbers = '0123456789' SET @strChars = CASE @op WHEN 'C' THEN @chars WHEN 'N' THEN @numbers WHEN 'CN' THEN @chars + @numbers ELSE '------' END SET @cont = 0 WHILE @cont < @size BEGIN SET @index = ceiling( ( SELECT rnd FROM vwRandom ) * (len(@strChars))) SET @strPass = @strPass + substring(@strChars, @index, 1) SET @cont = @cont + 1 END RETURN @strPass END")

    //Procedures

    await pool.request()
    .query("CREATE PROCEDURE HUMAN_R.SalaryCalculate AS DECLARE @Acumuladora MONEY,@salaryE INT SET @salaryE = 1 WHILE @salaryE<=(SELECT COUNT(*) FROM HUMAN_R.SALARY) BEGIN SET @Acumuladora = (SELECT mon_salary FROM HUMAN_R.SALARY_EMP SE INNER JOIN HUMAN_R.EMPLOYEES E ON E.int_employee_id_PK=SE.int_employee_id_FK INNER JOIN HUMAN_R.CONTRACTS C ON C.int_contract_id_PK=E.int_contract_id_FK WHERE SE.int_salary_id_FK=@salaryE) UPDATE HUMAN_R.SALARY SET mon_hourSalary = @Acumuladora/160 WHERE SALARY.int_salary_id_PK=@salaryE SET @Acumuladora = @Acumuladora + ISNULL((SELECT SUM(EX.tin_amount*SA.mon_hourSalary*(TY.flo_porcent/100)) FROM HUMAN_R.EXTRA_HOURS EX,HUMAN_R.SALARY SA,HUMAN_R.TYPE_HOURS TY WHERE EX.bit_payFactor=1 AND SA.int_salary_id_PK=@salaryE AND EX.int_salary_id_FK=@salaryE AND EX.tin_hourType_id_FK=TY.tin_hourType_id_PK AND EX.int_salary_id_FK=SA.int_salary_id_PK),0) SET @Acumuladora = @Acumuladora + ISNULL((SELECT SUM(MO.int_factor*MO.mon_amount) FROM HUMAN_R.SALARY SA,HUMAN_R.PAYMENT_MOVEMENT PM,HUMAN_R.MOVEMENT MO WHERE PM.int_salary_id_PK_FK=SA.int_salary_id_PK AND PM.int_movement_id_PK_FK = MO.int_movement_id_PK AND PM.bit_motionFactor=1 AND SA.int_salary_id_PK=@salaryE AND PM.int_salary_id_PK_FK=@salaryE),0) UPDATE HUMAN_R.SALARY SET mon_netSalary = @Acumuladora WHERE SALARY.int_salary_id_PK=@salaryE print @Acumuladora SET @salaryE = @salaryE + 1 END")
    await pool.request()
    .query("CREATE PROCEDURE HUMAN_R.CreateSalaryEmployees AS DECLARE @dateEmployee DATE, @employee INT,@dateYear DATE, @ACUM INT,@ACUMM INT; SET NOCOUNT OFF; SET @ACUM = 1; SET @employee = 1; SET @ACUMM = (SELECT COUNT(*) FROM HUMAN_R.CONTRACTS); WHILE(@ACUMM>=@employee) BEGIN SET @dateEmployee = (SELECT dat_hiringDate FROM HUMAN_R.CONTRACTS WHERE int_contract_id_PK=@employee); SET @dateYear = DATEADD(DAY,30,@dateEmployee); WHILE(@dateYear<='2021-12-31') BEGIN INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,@dateYear,(SELECT tin_area_id_FK FROM HUMAN_R.EMPLOYEES WHERE int_employee_id_PK=@employee)); INSERT INTO HUMAN_R.SALARY_EMP(bit_pay,int_salary_id_FK,int_employee_id_FK) VALUES (1,@ACUM,@employee); SET @dateYear = DATEADD(DAY,30,@dateYear); SET @ACUM = @ACUM+1; END print @dateEmployee; SET @employee = @employee+1; END")
    await pool.request()
    .query("CREATE PROCEDURE HUMAN_R.ModifyAddress AS DECLARE @ADDREES BIGINT,@SUBURN INT, @CITIES INT, @DEPARTAMENT INT, @COUNTRY INT,@CONT BIGINT; SET @ADDREES =10; SET @CONT = (SELECT COUNT(*) FROM HUMAN_R.LIST_ADDRESS); WHILE(@ADDREES<=@CONT) BEGIN SET @SUBURN = (SELECT big_suburn_id_FK FROM HUMAN_R.LIST_ADDRESS WHERE big_address_id_PK=@ADDREES); SET @CITIES = (SELECT big_city_id_FK FROM HUMAN_R.SUBURN WHERE big_suburn_id_PK=@SUBURN); SET @DEPARTAMENT = (SELECT big_departament_id_FK FROM HUMAN_R.CITIES WHERE big_city_id_PK=@CITIES); SET @COUNTRY = (SELECT int_country_id_FK FROM HUMAN_R.DEPARTAMENT WHERE big_departament_id_PK=@DEPARTAMENT); UPDATE HUMAN_R.LIST_ADDRESS SET int_country_id_FK=@COUNTRY,big_departament_id_FK=@DEPARTAMENT,big_city_id_FK=@CITIES WHERE big_address_id_PK=@ADDREES; SET @ADDREES = @ADDREES + 1; END")

    pool.close;
    res.json("Succeses: Funcions, Tables, View end Procedures") 
};