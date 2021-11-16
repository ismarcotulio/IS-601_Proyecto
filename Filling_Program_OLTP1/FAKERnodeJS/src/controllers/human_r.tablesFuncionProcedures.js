import {getConnection} from '../database/connection'

export const tableFuncionProceduresFill = async (req, res) => {
    console.log("Generating Tables, Funcions, Views end Procedures");
    const pool = await getConnection();

    await pool.request()
    .query("DROP DATABASE CarDealership_OLTP1")
    await pool.request()
    .query("CREATE DATABASE CarDealership_OLTP1")
    await pool.request()
    .query("USE CarDealership_OLTP1")

    
    //Tables
    await pool.request()
    .query("CREATE TABLE dbo.AREA(tin_area_id_PK TINYINT PRIMARY KEY, var_name VARCHAR(60) NOT NULL, UNIQUE(var_name))");
    await pool.request()
    .query("CREATE TABLE dbo.POSITION(tin_position_id_PK TINYINT PRIMARY KEY,var_name VARCHAR(60) NOT NULL, unique(var_name))");
    await pool.request()
    .query("CREATE TABLE dbo.TYPE_HOURS(tin_hourType_id_PK TINYINT IDENTITY(1,1) PRIMARY KEY,flo_porcent float NOT NULL,var_name VARCHAR(60) NOT NULL,CHECK (flo_porcent > 0))");
    await pool.request()
    .query("CREATE TABLE dbo.MOVEMENT(int_movement_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY,tex_description TEXT NOT NULL,int_factor  INTEGER NOT NULL,mon_amount MONEY NOT NULL,CHECK (int_factor=-1 OR int_factor=1))");
    await pool.request()
    .query("CREATE TABLE dbo.COUNTRY( int_country_id_PK INTEGER PRIMARY KEY, var_name VARCHAR(60) NOT NULL, var_code VARCHAR(6) NOT NULL, unique(var_code),unique(var_name))");
    await pool.request()
    .query("CREATE TABLE dbo.DEPARTAMENT( big_departament_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY, var_name VARCHAR(60) NOT NULL, int_country_id_FK INTEGER NOT NULL REFERENCES dbo.COUNTRY(int_country_id_PK), CONSTRAINT [DEPARTAMENT_Unique] UNIQUE NONCLUSTERED ([var_name] ASC, [big_departament_id_PK] ASC) )");
    await pool.request()
    .query("CREATE TABLE dbo.CITIES( big_city_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY, var_name VARCHAR(60) NOT NULL, big_departament_id_FK BIGINT NOT NULL REFERENCES dbo.DEPARTAMENT(big_departament_id_PK), CONSTRAINT [cities_Unique] UNIQUE NONCLUSTERED ([var_name] ASC, [big_city_id_PK] ASC) )");
    await pool.request()
    .query("CREATE TABLE dbo.SUBURN( big_suburn_id_PK BIGINT PRIMARY KEY, var_name VARCHAR(60) NOT NULL, big_city_id_FK BIGINT NOT NULL REFERENCES dbo.CITIES(big_city_id_PK), CONSTRAINT [SUBURN_Unique] UNIQUE NONCLUSTERED ([var_name] ASC, [big_city_id_FK] ASC) )");
    await pool.request()
    .query("CREATE TABLE dbo.LIST_ADDRESS( big_address_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY, tex_reference TEXT NOT NULL, int_country_id_FK INTEGER NOT NULL REFERENCES dbo.COUNTRY(int_country_id_PK), big_departament_id_FK BIGINT NOT NULL REFERENCES dbo.DEPARTAMENT(big_departament_id_PK), big_city_id_FK BIGINT NOT NULL REFERENCES dbo.CITIES(big_city_id_PK), big_suburn_id_FK BIGINT NOT NULL REFERENCES dbo.SUBURN(big_suburn_id_PK))");
    await pool.request()
    .query("CREATE TABLE dbo.PERSON( big_person_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY, var_firstName VARCHAR(60) NOT NULL, var_secondName VARCHAR(60) NOT NULL, var_firstSurname VARCHAR(60) NOT NULL, var_secondSurname VARCHAR(60) NOT NULL, var_DNI VARCHAR(13) NOT NULL, dat_dateOfBirth DATE, big_address_id_FK BIGINT REFERENCES dbo.LIST_ADDRESS(big_address_id_PK), cha_gender CHAR NOT NULL, CHECK((cha_gender='M' OR cha_gender='m') or (cha_gender='F' OR cha_gender='f')) )");
    await pool.request()
    .query("CREATE TABLE dbo.CLIENT( big_client_id_PK BIGINT PRIMARY KEY, var_code VARCHAR(20), var_RTN_Personal VARCHAR(14) NOT NULL, UNIQUE (var_code) );")
    await pool.request()
    .query("CREATE TABLE dbo.CLIENT_COMPANY( int_company_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY, var_name VARCHAR(150) NOT NULL, big_id_address_FK BIGINT NOT NULL REFERENCES dbo.LIST_ADDRESS(big_address_id_PK), big_client_id_FK BIGINT NOT NULL REFERENCES dbo.CLIENT(big_client_id_PK) );")
    await pool.request()
    .query("CREATE TABLE dbo.CLIENT_PERSON( big_clientPerson_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY, big_person_id_FK BIGINT NOT NULL REFERENCES dbo.PERSON(big_person_id_PK), big_client_id_FK BIGINT NOT NULL REFERENCES dbo.CLIENT(big_client_id_PK) );")
    await pool.request()
    .query("CREATE TABLE dbo.CONTRACTS( int_contract_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY, bit_active BIT NOT NULL, mon_salary MONEY NOT NULL, tin_position_id_FK TINYINT NOT NULL REFERENCES POSITION(tin_position_id_PK) )");
    await pool.request()
    .query("CREATE TABLE dbo.SALARY( int_salary_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY, mon_netSalary MONEY NOT NULL, mon_hourSalary MONEY NOT NULL, dat_date DATE NOT NULL, tin_area_id_FK TINYINT NOT NULL REFERENCES dbo.AREA(tin_area_id_PK), CHECK (mon_netSalary > 0) )");
    await pool.request()
    .query("CREATE TABLE dbo.PAYMENT_MOVEMENT( bit_motionFactor BIT NOT NULL, int_movement_id_PK_FK INTEGER NOT NULL REFERENCES dbo.MOVEMENT(int_movement_id_PK), int_salary_id_PK_FK INTEGER NOT NULL REFERENCES dbo.SALARY(int_salary_id_PK), PRIMARY KEY (int_movement_id_PK_FK,int_salary_id_PK_FK) )");
    await pool.request()
    .query("CREATE TABLE dbo.EXTRA_HOURS( big_extra_id_PK BIGINT IDENTITY(1,1) PRIMARY KEY, dat_date DATE NOT NULL, tin_amount TINYINT NOT NULL, bit_payFactor BIT NOT NULL, tin_hourType_id_FK TINYINT NOT NULL REFERENCES dbo.TYPE_HOURS(tin_hourType_id_PK) ON DELETE CASCADE ON UPDATE CASCADE, int_salary_id_FK INTEGER NOT NULL REFERENCES dbo.SALARY(int_salary_id_PK), CHECK (tin_amount > 0) )");
    await pool.request()
    .query("CREATE TABLE dbo.BRANCH_OFFICES( tin_id_branch_PK TINYINT PRIMARY KEY, var_name VARCHAR(50) NOT NULL, big_id_address_FK BIGINT NOT NULL REFERENCES dbo.LIST_ADDRESS(big_address_id_PK), FOREIGN KEY(big_id_address_FK) REFERENCES dbo.LIST_ADDRESS(big_address_id_PK) )");
    await pool.request()
    .query("CREATE TABLE dbo.EMPLOYEES( int_employee_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY, var_code VARCHAR(10) NOT NULL, tin_branch_id_FK TINYINT REFERENCES BRANCH_OFFICES(tin_id_branch_PK), big_person_id_FK BIGINT NOT NULL REFERENCES PERSON(big_person_id_PK) ON DELETE CASCADE ON UPDATE CASCADE, tin_area_id_FK TINYINT NOT NULL REFERENCES AREA(tin_area_id_PK), CONSTRAINT EMPLOYEES_CODE_unique UNIQUE(var_code), CONSTRAINT EMPLOYEES_PERSON_unique UNIQUE(big_person_id_FK))");
    await pool.request()
    .query("CREATE TABLE dbo.TYPE_REGISTRATION( tin_typeRegistration_id_PK TINYINT PRIMARY KEY, var_name VARCHAR(50) NOT NULL, tex_description TEXT NOT NULL)");
    await pool.request()
    .query("CREATE TABLE dbo.REGISTRATION_HIRES( int_registration_id_PK INTEGER IDENTITY(1,1) PRIMARY KEY, int_contract_id_FK INTEGER NOT NULL REFERENCES CONTRACTS(int_contract_id_PK), dat_hiringDate DATE NOT NULL, int_employee_id_FK INTEGER NOT NULL REFERENCES EMPLOYEES(int_employee_id_PK), tin_typeRegistration_id_FK TINYINT NOT NULL REFERENCES TYPE_REGISTRATION(tin_typeRegistration_id_PK))");
    await pool.request()
    .query("CREATE TABLE dbo.SALARY_EMP( bit_pay BIT NOT NULL, int_salary_id_FK INTEGER NOT NULL REFERENCES dbo.SALARY(int_salary_id_PK), int_employee_id_FK INTEGER NOT NULL REFERENCES dbo.EMPLOYEES(int_employee_id_PK), PRIMARY KEY(int_salary_id_FK,int_employee_id_FK))");
    await pool.request()
    .query("CREATE TABLE dbo.TELEPHONES_TYPE( tin_telephonType_id_PK TINYINT PRIMARY KEY, var_name VARCHAR(50) NOT NULL )");
    await pool.request()
    .query("CREATE TABLE dbo.TELEPHONES( big_telephon_id_PK BIGINT PRIMARY KEY, var_number VARCHAR(12) NOT NULL, tin_telephonType_id_FK TINYINT NOT NULL REFERENCES dbo.TELEPHONES_TYPE(tin_telephonType_id_PK), int_country_id_FK INTEGER NOT NULL REFERENCES dbo.COUNTRY(int_country_id_PK),UNIQUE (var_number,int_country_id_FK))");
    await pool.request()
    .query("CREATE TABLE dbo.TELEPHONES_PERSON( bit_active BIT NOT NULL, big_person_id_FK BIGINT NOT NULL REFERENCES dbo.PERSON(big_person_id_PK) ON DELETE CASCADE ON UPDATE CASCADE, big_telephon_id_FK BIGINT REFERENCES dbo.TELEPHONES(big_telephon_id_PK), PRIMARY KEY (big_telephon_id_FK,big_person_id_FK));");
    await pool.request()
    .query("CREATE TABLE dbo.TELEPHONES_COMPANY( bit_active BIT NOT NULL, big_telephon_id_FK BIGINT REFERENCES dbo.TELEPHONES(big_telephon_id_PK), int_company_id_FK INTEGER REFERENCES dbo.CLIENT_COMPANY(int_company_id_PK), PRIMARY KEY (big_telephon_id_FK,int_company_id_FK) );");

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
    .query("CREATE PROCEDURE dbo.DATEREGIS AS DECLARE @dateCon DATE,@Registra INT; SET @Registra =1 WHILE (@Registra<(SELECT COUNT(*) FROM REGISTRATION_HIRES WHERE tin_typeRegistration_id_FK = 1)) BEGIN SET @dateCon = ISNULL((SELECT dat_hiringDate FROM REGISTRATION_HIRES WHERE tin_typeRegistration_id_FK = 1 AND int_contract_id_FK = @Registra),'1999-01-01'); IF(@dateCon != '1999-01-01') BEGIN UPDATE REGISTRATION_HIRES SET dat_hiringDate = (dbo.getRandomDate(@dateCon, '2021-12-30')) WHERE tin_typeRegistration_id_FK > 1 AND int_contract_id_FK = @Registra; END SET @Registra = @Registra+1; END")
    await pool.request()
    .query("CREATE PROCEDURE dbo.SalaryCalculate AS DECLARE @Acumuladora MONEY,@salaryE INT SET @salaryE = 1 WHILE @salaryE<=(SELECT COUNT(*) FROM SALARY) BEGIN SET @Acumuladora = (SELECT mon_salary FROM SALARY_EMP SE INNER JOIN EMPLOYEES E ON E.int_employee_id_PK=SE.int_employee_id_FK INNER JOIN REGISTRATION_HIRES C ON C.int_employee_id_FK=E.int_employee_id_PK INNER JOIN CONTRACTS CO ON C.int_contract_id_FK=CO.int_contract_id_PK WHERE SE.int_salary_id_FK=@salaryE AND C.tin_typeRegistration_id_FK=1) UPDATE SALARY SET mon_hourSalary = @Acumuladora/160 WHERE SALARY.int_salary_id_PK=@salaryE SET @Acumuladora = @Acumuladora + ISNULL((SELECT SUM(EX.tin_amount*SA.mon_hourSalary*(TY.flo_porcent/100)) FROM EXTRA_HOURS EX,SALARY SA,TYPE_HOURS TY WHERE EX.bit_payFactor=1 AND SA.int_salary_id_PK=@salaryE AND EX.int_salary_id_FK=@salaryE AND EX.tin_hourType_id_FK=TY.tin_hourType_id_PK AND EX.int_salary_id_FK=SA.int_salary_id_PK),0) SET @Acumuladora = @Acumuladora + ISNULL((SELECT SUM(MO.int_factor*MO.mon_amount) FROM SALARY SA,PAYMENT_MOVEMENT PM,MOVEMENT MO WHERE PM.int_salary_id_PK_FK=SA.int_salary_id_PK AND PM.int_movement_id_PK_FK = MO.int_movement_id_PK AND PM.bit_motionFactor=1 AND SA.int_salary_id_PK=@salaryE AND PM.int_salary_id_PK_FK=@salaryE),0) UPDATE SALARY SET mon_netSalary = @Acumuladora WHERE SALARY.int_salary_id_PK=@salaryE; SET @salaryE = @salaryE + 1; END")
    await pool.request()
    .query("CREATE PROCEDURE dbo.CreateSalaryEmployees AS DECLARE @dateEmployee DATE, @employee INT,@dateYear DATE, @ACUM INT,@ACUMM INT; SET NOCOUNT OFF; SET @ACUM = 1; SET @employee = 1; SET @ACUMM = (SELECT COUNT(*) FROM CONTRACTS); WHILE(@ACUMM>=@employee) BEGIN SET @dateEmployee = (SELECT dat_hiringDate FROM REGISTRATION_HIRES RE WHERE re.tin_typeRegistration_id_FK=1 AND RE.int_employee_id_FK=@employee); SET @dateYear = DATEADD(DAY,30,@dateEmployee); WHILE(@dateYear<=ISNULL((SELECT dat_hiringDate FROM REGISTRATION_HIRES RE WHERE RE.tin_typeRegistration_id_FK>1 AND RE.int_employee_id_FK=@employee),'2021-12-31')) BEGIN INSERT INTO SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,@dateYear,(SELECT tin_area_id_FK FROM EMPLOYEES WHERE int_employee_id_PK=@employee)); INSERT INTO SALARY_EMP(bit_pay,int_salary_id_FK,int_employee_id_FK) VALUES (1,@ACUM,@employee); SET @dateYear = DATEADD(DAY,30,@dateYear); SET @ACUM = @ACUM+1; END print @dateEmployee; SET @employee = @employee+1; END")
    await pool.request()
    .query("CREATE PROCEDURE dbo.ModifyAddress AS DECLARE @ADDREES BIGINT,@SUBURN INT, @CITIES INT, @DEPARTAMENT INT, @COUNTRY INT,@CONT BIGINT; SET @ADDREES =10; SET @CONT = (SELECT COUNT(*) FROM dbo.LIST_ADDRESS); WHILE(@ADDREES<=@CONT) BEGIN SET @SUBURN = (SELECT big_suburn_id_FK FROM dbo.LIST_ADDRESS WHERE big_address_id_PK=@ADDREES); SET @CITIES = (SELECT big_city_id_FK FROM dbo.SUBURN WHERE big_suburn_id_PK=@SUBURN); SET @DEPARTAMENT = (SELECT big_departament_id_FK FROM dbo.CITIES WHERE big_city_id_PK=@CITIES); SET @COUNTRY = (SELECT int_country_id_FK FROM dbo.DEPARTAMENT WHERE big_departament_id_PK=@DEPARTAMENT); UPDATE dbo.LIST_ADDRESS SET int_country_id_FK=@COUNTRY,big_departament_id_FK=@DEPARTAMENT,big_city_id_FK=@CITIES WHERE big_address_id_PK=@ADDREES; SET @ADDREES = @ADDREES + 1; END")
    await pool.request()
    .query("CREATE PROCEDURE dbo.MOVEMENT_PAY AS DECLARE @salary int, @Hours bit, @dateS DATE,@cant int; SET @salary = 1; SET @cant = (SELECT COUNT(*) FROM SALARY) WHILE (@salary<=@cant) BEGIN SET @dateS = (SELECT dat_date FROM SALARY WHERE int_salary_id_PK=@salary) INSERT INTO PAYMENT_MOVEMENT(bit_motionFactor,int_movement_id_PK_FK,int_salary_id_PK_FK) VALUES (1,FLOOR(( SELECT rnd FROM vwRandom ) *(4-1)+1),@salary); INSERT INTO PAYMENT_MOVEMENT(bit_motionFactor,int_movement_id_PK_FK,int_salary_id_PK_FK) VALUES (1,FLOOR(( SELECT rnd FROM vwRandom ) *(9-5)+5),@salary); INSERT INTO PAYMENT_MOVEMENT(bit_motionFactor,int_movement_id_PK_FK,int_salary_id_PK_FK) VALUES (1,FLOOR(( SELECT rnd FROM vwRandom ) *(13-10)+10),@salary); IF (FLOOR(( SELECT rnd FROM vwRandom ) *(10-1)+1)<=5) BEGIN INSERT INTO EXTRA_HOURS(dat_date,tin_amount,bit_payFactor,tin_hourType_id_FK,int_salary_id_FK) VALUES (DATEADD(DAY,(-1*FLOOR(( SELECT rnd FROM vwRandom ) *(30-1)+1)),@dateS),FLOOR(( SELECT rnd FROM vwRandom ) *(4-1)+1),1,FLOOR(( SELECT rnd FROM vwRandom ) *(9-1)+1),@salary); INSERT INTO EXTRA_HOURS(dat_date,tin_amount,bit_payFactor,tin_hourType_id_FK,int_salary_id_FK) VALUES (DATEADD(DAY,(-1*FLOOR(( SELECT rnd FROM vwRandom ) *(30-1)+1)),@dateS),FLOOR(( SELECT rnd FROM vwRandom ) *(4-1)+1),1,FLOOR(( SELECT rnd FROM vwRandom ) *(9-1)+1),@salary); INSERT INTO EXTRA_HOURS(dat_date,tin_amount,bit_payFactor,tin_hourType_id_FK,int_salary_id_FK) VALUES (DATEADD(DAY,(-1*FLOOR(( SELECT rnd FROM vwRandom ) *(30-1)+1)),@dateS),FLOOR(( SELECT rnd FROM vwRandom ) *(4-1)+1),1,FLOOR(( SELECT rnd FROM vwRandom ) *(9-1)+1),@salary); END ELSE IF (FLOOR(( SELECT rnd FROM vwRandom ) *(10-1)+1)<=5) INSERT INTO EXTRA_HOURS(dat_date,tin_amount,bit_payFactor,tin_hourType_id_FK,int_salary_id_FK) VALUES (DATEADD(DAY,(-1*FLOOR(( SELECT rnd FROM vwRandom ) *(30-1)+1)),@dateS),FLOOR(( SELECT rnd FROM vwRandom ) *(4-1)+1),1,FLOOR(( SELECT rnd FROM vwRandom ) *(9-1)+1),@salary); SET @salary= @salary + 1; END")

    pool.close;
    res()
};


