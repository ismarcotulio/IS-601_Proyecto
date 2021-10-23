/*
Script de implementación para CarDealership_OLTP1_GIT

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "CarDealership_OLTP1_GIT"
:setvar DefaultFilePrefix "CarDealership_OLTP1_GIT"
:setvar DefaultDataPath "C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Creando Esquema [HUMAN_R]...';


GO
CREATE SCHEMA [HUMAN_R]
    AUTHORIZATION [dbo];


GO
PRINT N'Creando Esquema [LOGISTIC]...';


GO
CREATE SCHEMA [LOGISTIC]
    AUTHORIZATION [dbo];


GO
PRINT N'Creando Tabla [HUMAN_R].[DEPARTAMENT]...';


GO
CREATE TABLE [HUMAN_R].[DEPARTAMENT] (
    [big_departament_id_PK] BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_name]              VARCHAR (60) NOT NULL,
    [int_country_id_FK]     INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([big_departament_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[EMPLOYEES]...';


GO
CREATE TABLE [HUMAN_R].[EMPLOYEES] (
    [int_employee_id_PK] INT          IDENTITY (1, 1) NOT NULL,
    [ver_code]           VARCHAR (10) NOT NULL,
    [tin_branch_id_FK]   TINYINT      NULL,
    [big_person_id_FK]   BIGINT       NOT NULL,
    [int_contract_id_FK] INT          NOT NULL,
    [int_salary_id_FK]   INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([int_employee_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[EXTRA_HOURS]...';


GO
CREATE TABLE [HUMAN_R].[EXTRA_HOURS] (
    [big_extra_id_PK]    BIGINT  IDENTITY (1, 1) NOT NULL,
    [dat_date]           DATE    NOT NULL,
    [tin_amount]         TINYINT NOT NULL,
    [tin_hourType_id_FK] TINYINT NOT NULL,
    [int_salary_id_FK]   INT     NOT NULL,
    PRIMARY KEY CLUSTERED ([big_extra_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[LIST_ADDRESS]...';


GO
CREATE TABLE [HUMAN_R].[LIST_ADDRESS] (
    [big_address_id_PK]     BIGINT IDENTITY (1, 1) NOT NULL,
    [tex_reference]         TEXT   NOT NULL,
    [int_country_id_FK]     INT    NOT NULL,
    [big_departament_id_FK] BIGINT NOT NULL,
    [big_city_id_FK]        BIGINT NOT NULL,
    [big_suburn_id_FK]      BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([big_address_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[MOVEMENT]...';


GO
CREATE TABLE [HUMAN_R].[MOVEMENT] (
    [int_movement_id_PK] INT        IDENTITY (1, 1) NOT NULL,
    [tex_description]    TEXT       NOT NULL,
    [tin_factor]         TINYINT    NOT NULL,
    [flo_porcent]        FLOAT (53) NOT NULL,
    PRIMARY KEY CLUSTERED ([int_movement_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[PAYMENT_MOVEMENT]...';


GO
CREATE TABLE [HUMAN_R].[PAYMENT_MOVEMENT] (
    [bit_motionFactor]      BIT NOT NULL,
    [int_movement_id_PK_FK] INT NOT NULL,
    [int_salary_id_PK_FK]   INT NOT NULL,
    PRIMARY KEY CLUSTERED ([int_movement_id_PK_FK] ASC, [int_salary_id_PK_FK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[PERSON]...';


GO
CREATE TABLE [HUMAN_R].[PERSON] (
    [big_person_id_PK]  BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_firstName]     VARCHAR (60) NOT NULL,
    [var_secondName]    VARCHAR (60) NOT NULL,
    [var_firstSurname]  VARCHAR (60) NOT NULL,
    [var_secondSurname] VARCHAR (60) NOT NULL,
    [var_DNI]           VARCHAR (13) NOT NULL,
    [var_RTN_Personal]  VARCHAR (14) NOT NULL,
    [dat_dateOfBirth]   DATE         NULL,
    [big_address_id_FK] BIGINT       NULL,
    PRIMARY KEY CLUSTERED ([big_person_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[POSITION]...';


GO
CREATE TABLE [HUMAN_R].[POSITION] (
    [tin_position_id_PK] TINYINT      IDENTITY (1, 1) NOT NULL,
    [var_name]           VARCHAR (60) NOT NULL,
    [mon_salary]         MONEY        NOT NULL,
    PRIMARY KEY CLUSTERED ([tin_position_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[SALARY]...';


GO
CREATE TABLE [HUMAN_R].[SALARY] (
    [int_salary_id_PK]   INT     IDENTITY (1, 1) NOT NULL,
    [mon_netSalary]      MONEY   NOT NULL,
    [mon_hourSalary]     MONEY   NOT NULL,
    [tin_position_id_FK] TINYINT NOT NULL,
    PRIMARY KEY CLUSTERED ([int_salary_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[SUBURN]...';


GO
CREATE TABLE [HUMAN_R].[SUBURN] (
    [big_suburn_id_PK] BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_name]         VARCHAR (60) NOT NULL,
    [big_city_id_FK]   BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([big_suburn_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[TELEPHONES]...';


GO
CREATE TABLE [HUMAN_R].[TELEPHONES] (
    [big_telephon_id_PK] BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_nomber]         VARCHAR (12) NOT NULL,
    [big_person_id_FK]   BIGINT       NOT NULL,
    [int_country_id_FK]  INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([big_telephon_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[TYPE_HOURS]...';


GO
CREATE TABLE [HUMAN_R].[TYPE_HOURS] (
    [tin_hourType_id_PK] TINYINT      IDENTITY (1, 1) NOT NULL,
    [flo_porcent]        FLOAT (53)   NOT NULL,
    [var_name]           VARCHAR (60) NOT NULL,
    PRIMARY KEY CLUSTERED ([tin_hourType_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[BRANCH_OFFICES]...';


GO
CREATE TABLE [HUMAN_R].[BRANCH_OFFICES] (
    [tin_id_branch_PK]  TINYINT      NOT NULL,
    [var_name]          VARCHAR (50) NULL,
    [int_id_address_FK] INT          NULL,
    PRIMARY KEY CLUSTERED ([tin_id_branch_PK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[CITIES]...';


GO
CREATE TABLE [HUMAN_R].[CITIES] (
    [big_city_id_PK]        BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_name]              VARCHAR (60) NOT NULL,
    [big_departament_id_FK] BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([big_city_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[CONTRACTS]...';


GO
CREATE TABLE [HUMAN_R].[CONTRACTS] (
    [int_contract_id_PK] INT     IDENTITY (1, 1) NOT NULL,
    [dat_hiringDate]     DATE    NOT NULL,
    [bit_active]         BIT     NOT NULL,
    [tin_position_id_FK] TINYINT NOT NULL,
    PRIMARY KEY CLUSTERED ([int_contract_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [HUMAN_R].[COUNTRY]...';


GO
CREATE TABLE [HUMAN_R].[COUNTRY] (
    [int_country_id_PK] INT          IDENTITY (1, 1) NOT NULL,
    [var_name]          VARCHAR (60) NOT NULL,
    [var_code]          VARCHAR (6)  NOT NULL,
    PRIMARY KEY CLUSTERED ([int_country_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [LOGISTIC].[COLOR]...';


GO
CREATE TABLE [LOGISTIC].[COLOR] (
    [int_id_PK] INT          IDENTITY (1, 1) NOT NULL,
    [var_name]  VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([int_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [LOGISTIC].[BRAND]...';


GO
CREATE TABLE [LOGISTIC].[BRAND] (
    [int_id_PK]       INT          IDENTITY (1, 1) NOT NULL,
    [var_name]        VARCHAR (50) NOT NULL,
    [tex_description] TEXT         NULL,
    PRIMARY KEY CLUSTERED ([int_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [LOGISTIC].[TYPE_MOVEMENT]...';


GO
CREATE TABLE [LOGISTIC].[TYPE_MOVEMENT] (
    [tin_id_PK]       TINYINT      IDENTITY (1, 1) NOT NULL,
    [var_name]        VARCHAR (50) NOT NULL,
    [tex_description] TEXT         NULL,
    PRIMARY KEY CLUSTERED ([tin_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [LOGISTIC].[MANUFACTER]...';


GO
CREATE TABLE [LOGISTIC].[MANUFACTER] (
    [big_id_PK]       BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_name]        VARCHAR (50) NOT NULL,
    [var_commonName]  VARCHAR (50) NULL,
    [var_postalCode]  VARCHAR (50) NULL,
    [int_brand_FK]    INT          NOT NULL,
    [tin_location_FK] TINYINT      NULL,
    PRIMARY KEY CLUSTERED ([big_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [LOGISTIC].[MODEL]...';


GO
CREATE TABLE [LOGISTIC].[MODEL] (
    [int_id_PK]         INT          IDENTITY (1, 1) NOT NULL,
    [var_name]          VARCHAR (50) NOT NULL,
    [tex_description]   TEXT         NULL,
    [big_manufacter_FK] BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([int_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [LOGISTIC].[VEHICLE]...';


GO
CREATE TABLE [LOGISTIC].[VEHICLE] (
    [big_id_PK]            BIGINT       IDENTITY (1, 1) NOT NULL,
    [var_vin]              VARCHAR (45) NOT NULL,
    [int_kilometer]        INT          NULL,
    [tin_year_production]  TINYINT      NULL,
    [var_motor]            VARCHAR (50) NULL,
    [tin_number_cylinders] TINYINT      NULL,
    [bit_use_state]        BIT          NULL,
    [tex_description]      TEXT         NULL,
    [int_color_FK]         INT          NOT NULL,
    [int_model_FK]         INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([big_id_PK] ASC)
);


GO
PRINT N'Creando Tabla [LOGISTIC].[MOVEMENT]...';


GO
CREATE TABLE [LOGISTIC].[MOVEMENT] (
    [tin_id_PK]            TINYINT  IDENTITY (1, 1) NOT NULL,
    [dat_dueDateTime]      DATETIME NOT NULL,
    [tin_type_movement_FK] TINYINT  NULL,
    [tin_branch_FK]        TINYINT  NULL,
    [big_vehicle_FK]       BIGINT   NULL,
    PRIMARY KEY CLUSTERED ([tin_id_PK] ASC)
);


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [LOGISTIC].[BRAND]...';


GO
ALTER TABLE [LOGISTIC].[BRAND]
    ADD DEFAULT ('') FOR [tex_description];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [LOGISTIC].[TYPE_MOVEMENT]...';


GO
ALTER TABLE [LOGISTIC].[TYPE_MOVEMENT]
    ADD DEFAULT ('') FOR [tex_description];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [LOGISTIC].[MANUFACTER]...';


GO
ALTER TABLE [LOGISTIC].[MANUFACTER]
    ADD DEFAULT ('') FOR [var_commonName];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [LOGISTIC].[MANUFACTER]...';


GO
ALTER TABLE [LOGISTIC].[MANUFACTER]
    ADD DEFAULT ('') FOR [var_postalCode];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [LOGISTIC].[MANUFACTER]...';


GO
ALTER TABLE [LOGISTIC].[MANUFACTER]
    ADD DEFAULT ((0)) FOR [tin_location_FK];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [LOGISTIC].[MODEL]...';


GO
ALTER TABLE [LOGISTIC].[MODEL]
    ADD DEFAULT ('') FOR [tex_description];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [LOGISTIC].[VEHICLE]...';


GO
ALTER TABLE [LOGISTIC].[VEHICLE]
    ADD DEFAULT ((0)) FOR [int_kilometer];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [LOGISTIC].[VEHICLE]...';


GO
ALTER TABLE [LOGISTIC].[VEHICLE]
    ADD DEFAULT ((2001)) FOR [tin_year_production];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [LOGISTIC].[VEHICLE]...';


GO
ALTER TABLE [LOGISTIC].[VEHICLE]
    ADD DEFAULT ('') FOR [var_motor];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [LOGISTIC].[VEHICLE]...';


GO
ALTER TABLE [LOGISTIC].[VEHICLE]
    ADD DEFAULT ((4)) FOR [tin_number_cylinders];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [LOGISTIC].[VEHICLE]...';


GO
ALTER TABLE [LOGISTIC].[VEHICLE]
    ADD DEFAULT ((1)) FOR [bit_use_state];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [LOGISTIC].[VEHICLE]...';


GO
ALTER TABLE [LOGISTIC].[VEHICLE]
    ADD DEFAULT ('') FOR [tex_description];


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[DEPARTAMENT]...';


GO
ALTER TABLE [HUMAN_R].[DEPARTAMENT] WITH NOCHECK
    ADD FOREIGN KEY ([int_country_id_FK]) REFERENCES [HUMAN_R].[COUNTRY] ([int_country_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[EMPLOYEES]...';


GO
ALTER TABLE [HUMAN_R].[EMPLOYEES] WITH NOCHECK
    ADD FOREIGN KEY ([big_person_id_FK]) REFERENCES [HUMAN_R].[PERSON] ([big_person_id_PK]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[EMPLOYEES]...';


GO
ALTER TABLE [HUMAN_R].[EMPLOYEES] WITH NOCHECK
    ADD FOREIGN KEY ([int_contract_id_FK]) REFERENCES [HUMAN_R].[CONTRACTS] ([int_contract_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[EMPLOYEES]...';


GO
ALTER TABLE [HUMAN_R].[EMPLOYEES] WITH NOCHECK
    ADD FOREIGN KEY ([int_salary_id_FK]) REFERENCES [HUMAN_R].[SALARY] ([int_salary_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[EMPLOYEES]...';


GO
ALTER TABLE [HUMAN_R].[EMPLOYEES] WITH NOCHECK
    ADD FOREIGN KEY ([tin_branch_id_FK]) REFERENCES [HUMAN_R].[BRANCH_OFFICES] ([tin_id_branch_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[EXTRA_HOURS]...';


GO
ALTER TABLE [HUMAN_R].[EXTRA_HOURS] WITH NOCHECK
    ADD FOREIGN KEY ([int_salary_id_FK]) REFERENCES [HUMAN_R].[SALARY] ([int_salary_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[EXTRA_HOURS]...';


GO
ALTER TABLE [HUMAN_R].[EXTRA_HOURS] WITH NOCHECK
    ADD FOREIGN KEY ([tin_hourType_id_FK]) REFERENCES [HUMAN_R].[TYPE_HOURS] ([tin_hourType_id_PK]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[LIST_ADDRESS]...';


GO
ALTER TABLE [HUMAN_R].[LIST_ADDRESS] WITH NOCHECK
    ADD FOREIGN KEY ([big_city_id_FK]) REFERENCES [HUMAN_R].[CITIES] ([big_city_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[LIST_ADDRESS]...';


GO
ALTER TABLE [HUMAN_R].[LIST_ADDRESS] WITH NOCHECK
    ADD FOREIGN KEY ([big_departament_id_FK]) REFERENCES [HUMAN_R].[DEPARTAMENT] ([big_departament_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[LIST_ADDRESS]...';


GO
ALTER TABLE [HUMAN_R].[LIST_ADDRESS] WITH NOCHECK
    ADD FOREIGN KEY ([big_suburn_id_FK]) REFERENCES [HUMAN_R].[SUBURN] ([big_suburn_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[LIST_ADDRESS]...';


GO
ALTER TABLE [HUMAN_R].[LIST_ADDRESS] WITH NOCHECK
    ADD FOREIGN KEY ([int_country_id_FK]) REFERENCES [HUMAN_R].[COUNTRY] ([int_country_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[PAYMENT_MOVEMENT]...';


GO
ALTER TABLE [HUMAN_R].[PAYMENT_MOVEMENT] WITH NOCHECK
    ADD FOREIGN KEY ([int_movement_id_PK_FK]) REFERENCES [HUMAN_R].[MOVEMENT] ([int_movement_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[PAYMENT_MOVEMENT]...';


GO
ALTER TABLE [HUMAN_R].[PAYMENT_MOVEMENT] WITH NOCHECK
    ADD FOREIGN KEY ([int_salary_id_PK_FK]) REFERENCES [HUMAN_R].[SALARY] ([int_salary_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[PERSON]...';


GO
ALTER TABLE [HUMAN_R].[PERSON] WITH NOCHECK
    ADD FOREIGN KEY ([big_address_id_FK]) REFERENCES [HUMAN_R].[LIST_ADDRESS] ([big_address_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[SALARY]...';


GO
ALTER TABLE [HUMAN_R].[SALARY] WITH NOCHECK
    ADD FOREIGN KEY ([tin_position_id_FK]) REFERENCES [HUMAN_R].[POSITION] ([tin_position_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[SUBURN]...';


GO
ALTER TABLE [HUMAN_R].[SUBURN] WITH NOCHECK
    ADD FOREIGN KEY ([big_city_id_FK]) REFERENCES [HUMAN_R].[CITIES] ([big_city_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[TELEPHONES]...';


GO
ALTER TABLE [HUMAN_R].[TELEPHONES] WITH NOCHECK
    ADD FOREIGN KEY ([big_person_id_FK]) REFERENCES [HUMAN_R].[PERSON] ([big_person_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[TELEPHONES]...';


GO
ALTER TABLE [HUMAN_R].[TELEPHONES] WITH NOCHECK
    ADD FOREIGN KEY ([int_country_id_FK]) REFERENCES [HUMAN_R].[COUNTRY] ([int_country_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[CITIES]...';


GO
ALTER TABLE [HUMAN_R].[CITIES] WITH NOCHECK
    ADD FOREIGN KEY ([big_departament_id_FK]) REFERENCES [HUMAN_R].[DEPARTAMENT] ([big_departament_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [HUMAN_R].[CONTRACTS]...';


GO
ALTER TABLE [HUMAN_R].[CONTRACTS] WITH NOCHECK
    ADD FOREIGN KEY ([tin_position_id_FK]) REFERENCES [HUMAN_R].[POSITION] ([tin_position_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [LOGISTIC].[MANUFACTER]...';


GO
ALTER TABLE [LOGISTIC].[MANUFACTER] WITH NOCHECK
    ADD FOREIGN KEY ([int_brand_FK]) REFERENCES [LOGISTIC].[COLOR] ([int_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [LOGISTIC].[MODEL]...';


GO
ALTER TABLE [LOGISTIC].[MODEL] WITH NOCHECK
    ADD FOREIGN KEY ([big_manufacter_FK]) REFERENCES [LOGISTIC].[MANUFACTER] ([big_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [LOGISTIC].[VEHICLE]...';


GO
ALTER TABLE [LOGISTIC].[VEHICLE] WITH NOCHECK
    ADD FOREIGN KEY ([int_color_FK]) REFERENCES [LOGISTIC].[COLOR] ([int_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [LOGISTIC].[VEHICLE]...';


GO
ALTER TABLE [LOGISTIC].[VEHICLE] WITH NOCHECK
    ADD FOREIGN KEY ([int_model_FK]) REFERENCES [LOGISTIC].[MODEL] ([int_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [LOGISTIC].[MOVEMENT]...';


GO
ALTER TABLE [LOGISTIC].[MOVEMENT] WITH NOCHECK
    ADD FOREIGN KEY ([big_vehicle_FK]) REFERENCES [LOGISTIC].[VEHICLE] ([big_id_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [LOGISTIC].[MOVEMENT]...';


GO
ALTER TABLE [LOGISTIC].[MOVEMENT] WITH NOCHECK
    ADD FOREIGN KEY ([tin_branch_FK]) REFERENCES [HUMAN_R].[BRANCH_OFFICES] ([tin_id_branch_PK]);


GO
PRINT N'Creando Clave externa restricción sin nombre en [LOGISTIC].[MOVEMENT]...';


GO
ALTER TABLE [LOGISTIC].[MOVEMENT] WITH NOCHECK
    ADD FOREIGN KEY ([tin_type_movement_FK]) REFERENCES [LOGISTIC].[TYPE_MOVEMENT] ([tin_id_PK]);


GO
PRINT N'Creando Restricción CHECK restricción sin nombre en [HUMAN_R].[EXTRA_HOURS]...';


GO
ALTER TABLE [HUMAN_R].[EXTRA_HOURS] WITH NOCHECK
    ADD CHECK ([tin_amount]>(0));


GO
PRINT N'Creando Restricción CHECK restricción sin nombre en [HUMAN_R].[MOVEMENT]...';


GO
ALTER TABLE [HUMAN_R].[MOVEMENT] WITH NOCHECK
    ADD CHECK ([flo_porcent]>(0));


GO
PRINT N'Creando Restricción CHECK restricción sin nombre en [HUMAN_R].[MOVEMENT]...';


GO
ALTER TABLE [HUMAN_R].[MOVEMENT] WITH NOCHECK
    ADD CHECK ([tin_factor]=(-1) OR [tin_factor]=(1));


GO
PRINT N'Creando Restricción CHECK restricción sin nombre en [HUMAN_R].[SALARY]...';


GO
ALTER TABLE [HUMAN_R].[SALARY] WITH NOCHECK
    ADD CHECK ([mon_netSalary]>(0));


GO
PRINT N'Creando Restricción CHECK restricción sin nombre en [HUMAN_R].[TYPE_HOURS]...';


GO
ALTER TABLE [HUMAN_R].[TYPE_HOURS] WITH NOCHECK
    ADD CHECK ([flo_porcent]>(0));


GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
CREATE TABLE [#__checkStatus] (
    id           INT            IDENTITY (1, 1) PRIMARY KEY CLUSTERED,
    [Schema]     NVARCHAR (256),
    [Table]      NVARCHAR (256),
    [Constraint] NVARCHAR (256)
);

SET NOCOUNT ON;

DECLARE tableconstraintnames CURSOR LOCAL FORWARD_ONLY
    FOR SELECT SCHEMA_NAME([schema_id]),
               OBJECT_NAME([parent_object_id]),
               [name],
               0
        FROM   [sys].[objects]
        WHERE  [parent_object_id] IN (OBJECT_ID(N'HUMAN_R.DEPARTAMENT'), OBJECT_ID(N'HUMAN_R.EMPLOYEES'), OBJECT_ID(N'HUMAN_R.EXTRA_HOURS'), OBJECT_ID(N'HUMAN_R.LIST_ADDRESS'), OBJECT_ID(N'HUMAN_R.PAYMENT_MOVEMENT'), OBJECT_ID(N'HUMAN_R.PERSON'), OBJECT_ID(N'HUMAN_R.SALARY'), OBJECT_ID(N'HUMAN_R.SUBURN'), OBJECT_ID(N'HUMAN_R.TELEPHONES'), OBJECT_ID(N'HUMAN_R.CITIES'), OBJECT_ID(N'HUMAN_R.CONTRACTS'), OBJECT_ID(N'LOGISTIC.MANUFACTER'), OBJECT_ID(N'LOGISTIC.MODEL'), OBJECT_ID(N'LOGISTIC.VEHICLE'), OBJECT_ID(N'LOGISTIC.MOVEMENT'), OBJECT_ID(N'HUMAN_R.MOVEMENT'), OBJECT_ID(N'HUMAN_R.TYPE_HOURS'))
               AND [type] IN (N'F', N'C')
                   AND [object_id] IN (SELECT [object_id]
                                       FROM   [sys].[check_constraints]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0
                                       UNION
                                       SELECT [object_id]
                                       FROM   [sys].[foreign_keys]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0);

DECLARE @schemaname AS NVARCHAR (256);

DECLARE @tablename AS NVARCHAR (256);

DECLARE @checkname AS NVARCHAR (256);

DECLARE @is_not_trusted AS INT;

DECLARE @statement AS NVARCHAR (1024);

BEGIN TRY
    OPEN tableconstraintnames;
    FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
    WHILE @@fetch_status = 0
        BEGIN
            PRINT N'Comprobando restricción:' + @checkname + N' [' + @schemaname + N'].[' + @tablename + N']';
            SET @statement = N'ALTER TABLE [' + @schemaname + N'].[' + @tablename + N'] WITH ' + CASE @is_not_trusted WHEN 0 THEN N'CHECK' ELSE N'NOCHECK' END + N' CHECK CONSTRAINT [' + @checkname + N']';
            BEGIN TRY
                EXECUTE [sp_executesql] @statement;
            END TRY
            BEGIN CATCH
                INSERT  [#__checkStatus] ([Schema], [Table], [Constraint])
                VALUES                  (@schemaname, @tablename, @checkname);
            END CATCH
            FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
        END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') >= 0
    CLOSE tableconstraintnames;

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') = -1
    DEALLOCATE tableconstraintnames;

SELECT N'Error de comprobación de restricción:' + [Schema] + N'.' + [Table] + N',' + [Constraint]
FROM   [#__checkStatus];

IF @@ROWCOUNT > 0
    BEGIN
        DROP TABLE [#__checkStatus];
        RAISERROR (N'Error al comprobar las restricciones', 16, 127);
    END

SET NOCOUNT OFF;

DROP TABLE [#__checkStatus];


GO
PRINT N'Actualización completada.';


GO
