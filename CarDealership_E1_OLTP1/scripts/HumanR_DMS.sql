--FUNCIONS
CREATE VIEW seeder
AS
    SELECT RAND(CONVERT(VARBINARY, NEWID())) seed
GO

CREATE FUNCTION [dbo].[getRandomDate]
(
	@lower DATE,
	@upper DATE
)
RETURNS DATE
AS
BEGIN
	DECLARE @random DATE
	SELECT @random = DATEADD(day, DATEDIFF(DAY, @lower, @upper) * seed, @lower) FROM dbo.seeder
	RETURN @random
END
GO

CREATE VIEW vwRandom
AS
SELECT RAND() as Rnd
GO 

CREATE FUNCTION fnCustomPass 
(    
    @size AS INT, --Tamaño de la cadena aleatoria
    @op AS VARCHAR(2) --Opción para letras(ABC..), numeros(123...) o ambos.
)
RETURNS VARCHAR(62)
AS
BEGIN    

    DECLARE @chars AS VARCHAR(52),
            @numbers AS VARCHAR(10),
            @strChars AS VARCHAR(62),        
            @strPass AS VARCHAR(62),
            @index AS INT,
            @cont AS INT

    SET @strPass = ''
    SET @strChars = ''    
    SET @chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    SET @numbers = '0123456789'

    SET @strChars = CASE @op WHEN 'C' THEN @chars --Letras
                        WHEN 'N' THEN @numbers --Números
                        WHEN 'CN' THEN @chars + @numbers --Ambos (Letras y Números)
                        ELSE '------'
                    END

    SET @cont = 0
    WHILE @cont < @size
    BEGIN
        SET @index = ceiling( ( SELECT rnd FROM vwRandom ) * (len(@strChars)))--Uso de la vista para el Rand() y no generar error.
        SET @strPass = @strPass + substring(@strChars, @index, 1)
        SET @cont = @cont + 1
    END    
        
    RETURN @strPass

END
GO
--END FUNCIONS

--DBCC CHECKIDENT ('HUMAN_R.TYPE_HOURS', RESEED, 9)
--SELECT * FROM  HUMAN_R.TYPE_HOURS
--DELETE FROM  HUMAN_R.TYPE_HOURS WHERE tin_hourType_id_PK>9
INSERT INTO HUMAN_R.TYPE_HOURS(flo_porcent,var_name) VALUES 
	(130,'Dia de semana/Mañana'),
	(150,'Dia de semana/Tarde'),
	(180,'Dia de semana/Noche'),
	(170,'Fin de semana/Sabado/Mañana'),
	(180,'Fin de semana/Sabado/Tarde'),
	(190,'Fin de semana/Sabado/Noche'),
	(190,'Fin de semana/Domingo/Mañana'),
	(195,'Fin de semana/Domingo/Tarde'),
	(200,'Fin de semana/Domingo/Noche')

--DBCC CHECKIDENT ('HUMAN_R.MOVEMENT', RESEED, 13)
--SELECT * FROM  HUMAN_R.MOVEMENT
--DELETE FROM  HUMAN_R.MOVEMENT WHERE int_movement_id_PK>13
INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES 
	('Costo de vida',1,5000),
	('Aumento de salario minimo',1,2000),
	('Comision por ventas',1,1000),
	('Aumento por los Plus',1,4500),
	('Bono de transporte cada 6',1,3000),
	('Bono de vacaciones',1,1300),
	('Licencia por maternidad',1,1500),
	('CITRAMOVIL',-1,3400),
	('Seguro social IHHSS',-1,1200),
	('Indemnizaciones por traslados',-1,1000),
	('Indemnizaciones por suspensiones',-1,1300),
	('Indemnizaciones por despido',-1,2500),
	('Pagos a cooperativas de ahorro',-1,900)
GO

--DBCC CHECKIDENT ('HUMAN_R.POSITION', RESEED, 13)
--SELECT * FROM  HUMAN_R.POSITION
--DELETE FROM  HUMAN_R.POSITION WHERE tin_position_id_PK>13
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Gerente de Venta');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Supervisor de Venta');--2
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Servicio al Cliente');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Director de Operaciones');--4
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Director Ejecutivo');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Director de Marketing');--6
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Director Comercial');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Director de Recursos Humanos');--8
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Ingeniero en sistemas');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Operario');--10
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Mecanico');--11
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Secretaria');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Mantenimiento');--agregada 29-10-2011
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Ingeniero Automotris');--agregada 02-11-2011--14
GO

INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES 
	('2012/12/12',1,5,24000),
	('2012/12/12',1,1,15000),
	('2013/11/15',1,2,14000),
	('2013/10/22',1,9,12000),
	('2014/09/24',1,3,9000),
	('2017/01/13',1,3,9000),
	('2016/07/11',1,3,9000),
	('2014/06/09',0,3,9000),
	('2015/04/01',1,3,9000),
	('2013/11/05',1,3,9000),
	('2014/02/16',1,4,14000),
	('2013/10/23',0,11,8500),
	('2012/07/29',1,11,8500),
	('2014/11/30',1,11,8500),
	('2014/04/30',1,11,8500),
	('2015/08/04',1,10,8000),
	('2014/12/16',1,10,8000),
	('2016/10/11',1,10,8000),
	('2019/06/10',1,6,15000),
	('2020/07/09',1,7,14000),
	('2014/01/07',1,8,12000),
	('2012/11/11',1,12,8500),
	('2016/12/12',1,12,9500),
	('2017/09/13',1,12,8500),
	('2021/03/26',0,12,8500),
	('2015/04/27',1,12,8400),
	('2019/08/05',1,12,9500),
	('2017/11/21',1,9,12000)
GO
--agregada el 29-10'2021
--DBCC CHECKIDENT ('HUMAN_R.CONTRACTS', RESEED, 48)
--SELECT * FROM  HUMAN_R.CONTRACTS
--DELETE FROM  HUMAN_R.CONTRACTS WHERE int_contract_id_PK>48
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES 
	('2014/09/24',1,3,9000),
	('2017/01/13',1,3,9000),
	('2016/07/11',1,3,9000),
	('2014/06/09',0,3,9000),
	('2015/04/01',1,3,9000),
	('2013/11/05',1,3,9000),
	('2014/06/09',0,3,9000),
	('2015/04/01',1,3,9000),
	('2013/11/05',1,3,9000),
	('2012/12/12',1,9,14000),
	('2013/10/23',0,11,8500),
	('2012/07/29',1,11,8500),
	('2014/11/30',1,11,8500),
	('2014/04/30',1,11,8500),
	('2013/10/23',1,11,8500),
	('2012/07/29',1,11,8500),
	('2014/11/30',1,13,8000),
	('2014/04/30',1,13,8000),
	('2015/08/04',1,12,9000),
	('2014/12/16',1,10,8000)
GO
--agregada el 31-10-2021
--SELECT * FROM HUMAN_R.CONTRACTS
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES 
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,9,13500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,11,8500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,11,8500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,11,8500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,11,8500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,11,8500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,11,8500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,8000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,8000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,8000)
GO
--agregada el 1-11-2021
--SELECT * FROM HUMAN_R.CONTRACTS
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES 
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,3,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,11,9500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,11,8500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,11,8500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,10,8500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,10,9500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,10,8500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,10,8500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,10,8000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,8000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,8000)
GO
--agregada el 2-11-2021
--SELECT * FROM HUMAN_R.CONTRACTS
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES 
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,13,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,9,12500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,9,12500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,9,12500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,9,13500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,14,9500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,14,9500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,14,9500),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,14,8000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,14,8000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,12,9000),
	(dbo.getRandomDate('1969-01-01', '1998-12-30'),1,12,8000)
GO

--USE CarDealership_E1_OLTP1
--UPDATE HUMAN_R.AREA SET var_name = 'Area de Servicios y Mantenimiento' WHERE HUMAN_R.AREA.tin_area_id_PK=5; --editado el 29-10-2021
--DBCC CHECKIDENT ('HUMAN_R.AREA', RESEED, 8)
--SELECT * from HUMAN_R.AREA
--DELETE FROM HUMAN_R.AREA WHERE tin_area_id_PK>8 
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Ventas');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Finanzas');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Recursos Humanos');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Logistica');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area de Servicios y Mantenimiento');--editado el 29-10-2021
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Administracion');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Marketing');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Compras');--8
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Informatica');--9--agregado el 02-11-2021
go

--DBCC CHECKIDENT ('HUMAN_R.COUNTRY', RESEED, 11)
--SELECT * from HUMAN_R.COUNTRY
--DELETE FROM HUMAN_R.COUNTRY WHERE int_country_id_PK>11 
INSERT INTO HUMAN_R.COUNTRY (var_name,var_code) VALUES ('Honduras','504');
INSERT INTO HUMAN_R.COUNTRY (var_name,var_code) VALUES ('Haití','509');
INSERT INTO HUMAN_R.COUNTRY (var_name,var_code) VALUES ('Hungría','36');
INSERT INTO HUMAN_R.COUNTRY (var_name,var_code) VALUES ('Cuba','53');--4
INSERT INTO HUMAN_R.COUNTRY (var_name,var_code) VALUES ('Costa Rica','506');--5
INSERT INTO HUMAN_R.COUNTRY (var_name,var_code) VALUES ('Chile','56');--6
INSERT INTO HUMAN_R.COUNTRY (var_name,var_code) VALUES ('Colombia','57');--7
INSERT INTO HUMAN_R.COUNTRY (var_name,var_code) VALUES ('Argentina','54');
INSERT INTO HUMAN_R.COUNTRY (var_name,var_code) VALUES ('Salvador','503');--9
INSERT INTO HUMAN_R.COUNTRY (var_name,var_code) VALUES ('Nicaragua','505');--10
INSERT INTO HUMAN_R.COUNTRY (var_name,var_code) VALUES ('España','34');--11

INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Francisco Morazán',1);--1
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Comayagua',1);--2
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Cortés',1);--3
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Choluteca',1);--4
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Copán',1);--5
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Intibuca',1);--6
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Ocotepeque',1);--7
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Olancho',1);--8
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Nippes',2);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Sud',2);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Nord',2);--11
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Heves',3);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Fejer',3);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Tolna',3);--14
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Villa Clara',4);--15
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Artemisa',4);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Santiago de Cuba',4);--17
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Guanacaste',5);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Limón',5);--19
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('San José',5);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Heredia',5);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Atacama',6);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Valparaíso',6);--23
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Lahos',6);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Tarapacá',6);--25
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Santander',7);--26
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Bolívar',7);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Arauca',7);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Córdoba',7);--29
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('San Luis',8);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Rio Negro',8);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Buenos Aires',8);--32
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Tucuman',8);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('San Juan',8);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Santa Cruz',8);--35
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Santa Ana',9);--36
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('La Libertad',9);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('San Vicente',9);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('San Miguel',9);--39
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('La Unión',9);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Atlántico Norte',10);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Nueva Segovia',10);--42
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('León',10);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Managua',10);--44
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Atlántico Sur',10);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Madrid',11);--46
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Murcia',11);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Valencia',11);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Asturias',11);
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Barcelona',11);--50
INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Salamanca',11);--51

INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Tegucigalpa',1);--1
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Cedros',1);--2
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Talanga',1);--3
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Orica',1);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Sabanagrande',1);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Ojojona',1);--6
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('El porvenir',1);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('La libertad',2);--8
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('San Luis',2);--9
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Minas de Oro',2);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Lamini',2);--11
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Comayagua',2);--12
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('San Pedro Sula',3);--13
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('VillaNueva',3);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Santa Cruz de Yojoa',3);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Choloma',3);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Puerto Cortés',3);--17
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('San Manuel',3);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('La Lima',3);--19
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Marcovia',4);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Pespire',4);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Choluteca',4);--22
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('San Marcos de Colón',4);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('El Corpus',4);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Copan Ruinas',5);--25
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Santa Rita',5);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('La Union',5);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Trinidad',5);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Intibucá',6);--29
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Jesus de Otoro',6);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Dolores',6);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Yamaranguila',6);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Ocotepeque',7);--33
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Sinuapa',7);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('San Fernando',7);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('San Marcos',7);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Juticalpa',8);--37
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Catacamas',8);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Patuca',8);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Jano',8);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('San Esteban',8);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Bail',11);--42
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('La Victoire',11);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Santo Domingo',15);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Santa Clara',15);--45
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Manicaragua',15);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Corralillo',15);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Sagua',15);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Contramaestre',17);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Guamá',17);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Santiago de cuba',17);--51
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Limón',19);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Pococi',19);--53
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Matina',19);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Talamanca',19);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Valparaiso',23);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('San Antonio',23);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Loas Andes',23);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Tamarugal',25);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Cominera',26);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Soto Norte',26);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Yariguíes',26);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Vélez',26);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('San Carlos',29);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Montería',29);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Valencia',29);--66
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Tierralta',29);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Palermo',32);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Mataderos',32);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Villa Real',32);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('San Cristobal',32);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Matapán',36);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Santa Ana',36);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('El Porvenir',36);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('El Congo',36);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('San Miguel',39);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('San Jorge',39);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Ciudad Barrios',39);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Ocotal',42);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('El Jicaro',42);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Jalapa',42);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('El Crucero',44);--82 Managua
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('San Rafael del Sur',44);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('San Francisco Libre',44);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Getafe',46);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Pinto',46);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('La Rozas de Madrid',46);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Alpedrete',46);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Madrid',46);--89
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Sant Martí',50);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Les Cors',50);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Gracia',50);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Sant Andreu',50);
INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Robleda',51);
go

--DBCC CHECKIDENT ('HUMAN_R.SUBURN', RESEED, 110)
--SELECT * from HUMAN_R.SUBURN
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Villanueva',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Nueva Suyapa',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Coolonia Florencia Sur',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Hato del Medio',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Kennedy',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Altos de Trapiche',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('La Vega',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio el Edén',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia 15 de Septiembre',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Lomas del Guijarro',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia la Era',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia el Sitio',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia 21 de Octubre',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia san José del Pedregal',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia America',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Residencial las Hadas',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Loarque',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Tiloaeque',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia el Retiro',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Cooonia la primavera',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Villa Olimpica',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Bella Oriente',1)
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('El Tamarindo',2);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Las Crucitas',2);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio la bolasa',3);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio San Antonio',3);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Ojojona',6);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('El Jícaro',6);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Santa Cruz',6);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Ojojona',7);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('El Olvido',8);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Aldea Goteras',8);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Aldes Santa Fe',8);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Valle Bonito',8);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('La Pita',8);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('La Libertad',8);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('El Plan Grande',9);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('El Tablón',9);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Lamaní',11);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('La Mesetas',11);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Guajoco',11);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Ojo de Agua',11);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio Cabañas',12);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio Lourdes',12);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Francisco Morazán',12);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio San Blas',12);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia 21 de Abril',12);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia 1 de Mayo',12);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Escoto',12);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Santa Lucía',12);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio Torondon',12);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio Arriba',12);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio Abajo',12);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia los Almendros',12);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Los Naranjos',13);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Lomas de San Juan',13);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Satelite',13);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('San Pedro',13);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio Barandillas',13);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('La Esperanza',13);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Villa Florencia',13);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Lomas del Carmen',13);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Santa Martha',13);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Universidad',13);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Potosí',13);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Zerón',13);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Buenos Aires',17);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('San Martin',17);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('El Copen',17);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('La curva',17);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('San Isidro',17);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Pineda',19);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio las Colinas',22);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia el Chorizo',22);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia San Luis Anach',22);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Altos del Aeropuerto Sur',22);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio Valle',22);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Los Llanos',22);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Inmaculada',22);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Vanecia',22);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio Los Mangos',22);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio las Arenas',22);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Nueva Esperanza',25);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio el Centro',25);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio las Delicias',29);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio el Terreno',29);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio LLano de la Virgen',29);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio el Molino',29);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio San Andrés',33);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia los Angeles',37);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia los Profesores',37);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia la Alambrada',37);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Sosa Lobo',37);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia la Solidaridad',37);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Barrio la Hoya',37);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Colonia Lempira',37);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Chery',42);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Reparto Camacho',45);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Reoarto Del Carmen',45);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Reparto Santa Catalina',45);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Reparto Virginia',45);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Reparto Asunción',51);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Reparto Versalles',51);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Los Lagos',53);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('El Rótulo',53);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Ensanche',66);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Patraix',66);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Salamanca',89);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Socorro',74);
INSERT INTO HUMAN_R.SUBURN(var_name,big_city_id_FK) VALUES ('Las Conchitas',82)

INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES 
    ('Sin datos',1,1,1,1),
    ('Sin datos',1,1,1,2), 
    ('Sin datos',1,1,1,3), 
    ('A una cuadra del Hospital San Jorge',1,1,1,4), 
    ('Boulevard CentroAmerica, Contigo a Equipos Industriales',1,1,1,5), --5 Sucursal Tegucigalpa
    ('Cuarta etapa, Covespul',1,1,1,6), 
    ('Sin datos',1,1,1,7), 
    ('Sin datos',1,1,1,8), 
    ('Sin datos',1,1,1,9), 
    ('Sin datos',1,1,1,10), 
    ('Sin datos',1,1,1,11), 
    ('A la par de la iglecia Hossana',1,1,1,12), 
    ('Sin datos',1,1,1,13), 
    ('Sin datos',1,1,1,14), 
    ('Sin datos',1,1,1,15), 
    ('Sin datos',1,1,1,16), 
    ('Sin datos',1,1,1,17), 
    ('Sin datos',1,1,1,18), 
    ('Sin datos',1,1,1,19), 
    ('Sin datos',1,1,1,20), 
    ('Sin datos',1,1,1,21),
    ('A tres casas de la escuela Paraguay',1,1,1,22)
GO

--Use CarDealership_E1_OLTP1
--SELECT * from HUMAN_R.LIST_ADDRESS
--DBCC CHECKIDENT ('HUMAN_R.PERSON', RESEED, 110)
--tegucigalpa 1/1 nos da hasta el 1
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES 
    ('Sin datos',1,1,2,23),
    ('Sin datos',1,1,2,24)
GO
--Cedros 1/1 nos da hasta el 2
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES 
    ('Sin datos',1,1,3,25),
    ('Sin datos',1,1,3,26)
GO
--Talanga 1/1 nos da hasta el 3
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES 
    ('Sin datos',1,1,6,27),
    ('Sin datos',1,1,6,28),
    ('Sin datos',1,1,6,29)
GO
--Ojojona 1/1 nos da hasta el 6
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,7,30);
GO
--El porvenir 1/1 nos da hasta el 7
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES 
    ('Sin datos',1,2,8,31),
    ('Sin datos',1,2,8,32),
    ('Sin datos',1,2,8,33),
    ('Sin datos',1,2,8,34),
    ('Sin datos',1,2,8,35),
    ('Sin datos',1,2,8,36),
    ('Sin datos',1,2,9,37),
    ('Sin datos',1,2,9,38),
    ('Sin datos',1,2,11,39),
    ('Sin datos',1,2,11,40),
    ('Sin datos',1,2,11,41),
    ('Sin datos',1,2,11,42),
    ('Sin datos',1,2,12,43),
    ('Sin datos',1,2,12,44),
    ('Sin datos',1,2,12,45),
    ('Sin datos',1,2,12,46),
    ('Sin datos',1,2,12,47),
    ('Sin datos',1,2,12,48),
    ('Sin datos',1,2,12,49),
    ('Sin datos',1,2,12,50),
    ('Al par de Hotel America',1,2,12,51),--sucursal 51 Comayagua
    ('Sin datos',1,2,12,52),
    ('Sin datos',1,2,12,53),
    ('Sin datos',1,2,12,54)
GO
--Comayagua 2 nos da hasta 12
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES 
    ('Sin datos',1,3,13,55),
    ('Sin datos',1,3,13,56),
    ('Sin datos',1,3,13,57),
    ('Sin datos',1,3,13,58),
    ('Sin datos',1,3,13,59),
    ('Sin datos',1,3,13,60),
    ('Sin datos',1,3,13,61),
    ('Sin datos',1,3,13,62),
    ('Sin datos',1,3,13,63),
    ('Sin datos',1,3,13,64),
    ('Sin datos',1,3,13,65),
    ('Sin datos',1,3,13,66),
    ('Sin datos',1,3,17,67),
    ('Sin datos',1,3,17,68),
    ('Sin datos',1,3,17,69),
    ('Sin datos',1,3,17,70),
    ('Frente a la iglesia Catolica de San Isidro',1,3,17,71),--sucursal 71 Cortes
    ('Sin datos',1,3,19,72)
GO
--Cortes 3 nos da hasta 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES 
    ('Sin datos',1,4,22,73),
    ('Sin datos',1,4,22,74),
    ('Sin datos',1,4,22,75),
    ('Sin datos',1,4,22,76),
    ('Sin datos',1,4,22,77),
    ('Sin datos',1,4,22,78),
    ('En frente de la Iglesia Catolica San Juan Pablo II',1,4,22,79),--Sucursal 79 Choluteca
    ('Sin datos',1,4,22,80),
    ('Sin datos',1,4,22,81),
    ('Sin datos',1,4,22,82)
GO
--Choluteca 4 nos hasta 22
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES 
    ('Sin datos',1,5,25,83),
    ('Sin datos',1,5,25,84)
GO
--Copan 5 nos hasta 25
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES 
    ('Sin datos',1,6,29,85),
    ('Sin datos',1,6,29,86),
    ('Sin datos',1,6,29,87),
    ('Sin datos',1,6,29,88)
GO
--Intibuca 6 nos hasta 29
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,7,33,89);
GO
--Ocotepeque 7 nos hasta 33
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES 
    ('Sin datos',1,8,37,90),
    ('Sin datos',1,8,37,91),
    ('Sin datos',1,8,37,92),
    ('Sin datos',1,8,37,93),
    ('Sin datos',1,8,37,94),
    ('Sin datos',1,8,37,95),
    ('Sin datos',1,8,37,96)
GO
--Olancho 8 nos hasta 37
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',2,11,42,97);
GO
--Nord 11/ 2 nos hasta 42
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES 
    ('Sin datos',4,15,45,98),
    ('Sin datos',4,15,45,99),
    ('Sin datos',4,15,45,100),
    ('A tres casas del Hospital Venecia 103',4,15,45,101)--sucursal 101
GO
--Villa clara 15/ 4 hasta 45
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES 
    ('Sin datos',4,17,51,102),
    ('Sin datos',4,17,51,103)
GO
--Santiago de Cuba 17/ 4  hasta el 51
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES 
    ('Sin datos',5,17,53,104),
    ('A la par de pizzeria Victoria, calle 249',5,17,53,105)--Sucursal 105 limon Costa rica
GO
--Pococi 19/ 5   hasta el 53
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Entre el parque José María Cordoba, al par de la tienda de Isa',7,29,66,106);--sucursal 106  Cordoba, Colombia
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',7,29,66,107);
--Valencia 29/ 7  hasta el 66
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',11,46,89,108);
GO
--Madrid 46/ 11 hasta el 89
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Iglesia la Palabra que Cambia',9,36,74,109); --Sucursal 109 Santa Ana el Salvador
GO
--Santa Ana  36/9 hasta el 74
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Frente al Empalame el Crusero',10,44,82,110);--Sucursal 110
--Managua 44/10 hasta el 110
GO

--SELECT * FROM HUMAN_R.BRANCH_OFFICES
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (1,'Sucursal de Tegucigalpa',5);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (2,'Sucursal de Comayagua',51);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (3,'Sursal de Cortes',71);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (4,'Sursal de Choluteca',79);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (5,'Sursal de Villa Clara, Cuba',101);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (6,'Sursal de Limon, Costa Rica',105);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (7,'Sursal de Cordoba, Colombia',106);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (8,'Sursal de Santa Ana, El Salvador',109);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (9,'Sursal de Managua, Nicaragua',110);
GO

--delete from HUMAN_R.PERSON
INSERT INTO HUMAN_R.PERSON(var_firstName,var_secondName,var_firstSurname, var_secondSurname,var_DNI,var_RTN_Personal,dat_dateOfBirth,cha_gender,big_address_id_FK) VALUES
	 ('Juan','Manuel','Perez','Gonzales',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',72),
	 ('Gabriela','','Cardona','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',62),
	 ('Roberto','Carlos','del Pino','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',22),
	 ('Luis','Ernesto','Castillo','Escamilla','0801200004393','93839830930393', dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',1);
INSERT INTO HUMAN_R.PERSON(var_firstName,var_secondName,var_firstSurname, var_secondSurname,var_DNI,var_RTN_Personal,dat_dateOfBirth,cha_gender,big_address_id_FK) VALUES
	 ('Oscar','Andres','Castillo','Escamilla',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',1);
INSERT INTO HUMAN_R.PERSON(var_firstName,var_secondName,var_firstSurname, var_secondSurname,var_DNI,var_RTN_Personal,dat_dateOfBirth,cha_gender,big_address_id_FK) VALUES
	 ('Omar','Antonio','Castillo','Escamilla',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',2),
	 ('Jorge','Ernesto','Mesa','Artigas',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',3),
	 ('Maria','Adoración','Predrin','Lozano',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',4), 
	 ('Alma','Marcela','Prieto','Soran',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',6),
	 ('Carlos','Ruben','de Burgos','Artigas',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',7),
	 ('Isaías','Leon','de De Velen','Roda',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',8),
	 ('Sonia','Pacifica','Pedrero','Pineda',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',9),
	 ('German','Sanjuan','Sedano','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',10),
	 ('David','Albero','Palmer','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',11),
	 ('Alonso','Amancio','Gonzalez','Galván',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',12),
	 ('Emilio','Sedano','Blázquez','Nuñez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',13),
	 ('Rasa','Maria','Escamilla','Hernandez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',14),
	 ('Eladio','','Buendía','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',15),
	 ('Sofia','Margarita','del Bueno','Velasquez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',16),
	 ('Elisa','Noriega','Quintanilla','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',17),
	 ('Nereiga','Pons','Barba','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',18),
	 ('Rodrigo','Galan','del Valle','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',19),
	 ('Kenia','Sofia','Beltran','Nuñez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',20),
	 ('Aurora','Feliciana','Montero','Revilla',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',21),
	 ('Angelina','Noemí','Cámara','Llorente',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',22),
	 ('Gala','','García','Trillo',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',23),
	 ('Benita','Herrera','Castro','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',24),
	 ('Flavio','Sandalio','Ricart','Mesa',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',25),
	 ('Anabel','','Jáuregui','Barón',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',26),
	 ('Oswaldo','','de Tejedor','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',27),
	 ('Javi','Oller','Roldan','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',28),
	 ('Jose','Antonio','Hoyos','Tur',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',29),
	 ('Apolonia','Manzano','Merino','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',30),
	 ('Gerardo','Echeverría','Dominguez','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',31),
	 ('Cándida','Encarna','Mariño','Taboada',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',32),
	 ('Ileana','Nicole','Perez','Nuñez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',33),
	 ('Enrique','Nando','Acedo','Peinado',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',34),
	 ('Natividad','Pujuras','Quintero','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',35),
	 ('Julio','Federico','Canales','Molins',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',36),
	 ('Javi','','Pol','Barrera',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',37),
	 ('Teodoro','','Mora','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',38),
	 ('José','Nicolas','Mora','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',39),
	 ('Amando','','Mariño','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',40),
	 ('Marcela','Múñiz','Vicens','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',41),
	 ('Angelino','Diéguez','Llamas','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',42),
	 ('Victor','','Moreno','Rivera',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',43),
	 ('Omar','Ariel','Benito','Suarez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',44),
	 ('Fernando','Aguilar','Barbero','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',45),
	 ('Odalis','','Tomas','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',46),
	 ('Adrián','Palacio','Becerra','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',47),
	 ('Abel','','Guerra','Vilaplana',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',48),
	 ('Nicolas','Quirino','Lluch','Rosa',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',49),
	 ('Lupita','Pacheco','Manzano','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',50),
	 ('Esmeralda Criado Cabrera','','Lluch','Rosa',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',52),--grupo
	 ('Javiera','','Viña','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',53),
	 ('Jacobo','Medina','Tapia','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',54),
	 ('Rosalía','','Alcolea','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',55),
	 ('Ruth','Azahara','Priego','Caballero',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',56),
	 ('Haroldo','Ramón','Salvá','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',57),
	 ('Eustaquio','','Carballo','Quirós',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',58),
	 ('Albino','Reynaldo','Robles','Azcona',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',59),
	 ('Vilma','','Carreras','Llano',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',60),
	 ('Irene','','Corral','Tejeda',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',61),
	 ('Josue','Antúnez','Peralta','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',62),
	 ('Pablo','','de Carrasco','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',63),
	 ('Rosario','Bou','Espejo','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',64),
	 ('Hilario','Quirino','Quesada','Uriarte',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',65),
	 ('Renata','Barranco','Cuadrado','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',66),
	 ('Francisco','José','Hernando','Pla Sanz',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',67),
	 ('Anabel','Alemany','Guitart','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',68),
	 ('Florencio','','Cuenca','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',69),
	 ('Heliodoro','Villalba','Carranza','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',70),
	 ('Evelia','Serna','Cases','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',72),--GRUPO
	 ('Reyes','Somoza','Alcatraz','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',73),
	 ('Roberto','','Cabañas','Arribas',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',74),
	 ('Felix','Manuel','Córdoba','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',75),
	 ('Andrés','Zurita','Duque','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',76),
	 ('Cecilia','','Elías','Mariño',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',77),
	 ('Maximiliano','','Terrón','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',78),
	 ('Sancho','','Acuña','Corominas',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',80),
	 ('Martirio','','Riera','Lloret',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',81),
	 ('Adrian','','Del Caballero','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',82),
	 ('Milagros','Cabezas','Noriega','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',83),
	 ('Caridad','','Rios','Lerma',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',84),
	 ('Melisa','','Mulet','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',85),
	 ('Cristian','Folch','Azorin','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',86),
	 ('Gastón','Buenaventura','Palacio','Zamora',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',87),
	 ('José','Angel','Del Barba','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',88),
	 ('Martín','','de Figueras','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',89),
	 ('Buenavenura','','del Pino','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',90),
	 ('Édgar','Latra','Silva','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',91),
	 ('Mateo','Trujillo','Morcillo','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',92),
	 ('Nacho','','Valbuena','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',93),
	 ('Alondra','Uría','Gascón','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',94),
	 ('José','Manuel','Chamorro','Sotelo',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',95),
	 ('Kimberly','','Shaffer','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',96),--GRUPO
	 ('Bianca','Janet','Richards','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',97),
	 ('Joseph','Manuel','Chen','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',98),
	 ('Evelyn','','Olson','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',99),
	 ('Antony','','West','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',100),
	 ('Oscar','Andrés','Castillo','Velasquez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'M',102),
	 ('Laurent','Marin','Du Morel','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',103),
	 ('Cristina','Michelle','Herdandez','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',104),
	 ('Nathalie','Alfaro','Costa','Moreno',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',107),
	 ('Alice','Rude','Lucas','Leroy',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'),dbo.getRandomDate('1969-01-01', '1998-12-30'),'F',108)
go
--Agregada el 29/10/2021
INSERT INTO HUMAN_R.PERSON(var_firstName,var_secondName,var_firstSurname, var_secondSurname,var_DNI,var_RTN_Personal,dat_dateOfBirth,cha_gender,big_address_id_FK) VALUES
	('Karen','Sofia','Galo','García',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',13),
	('Rodrigo','','Duarte','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',35),
	('Carlos','Fernando','Bueso','Murillo',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',6),
	('Sofia','Victoria','Robles','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',99),
	('Emiliano','','Dorsal','Varela',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',107),
	('Samuel','','Chavez','Sanchis',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',100),
	('Manuel','Oliveiras','de la Fuente','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',93),
	('José','Ramon','Angulo','Puig',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',64),
	('Felipe','Prada','Canosa','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',70),
	('Ivan','Uribe','Araujo','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',78),
	('Ramon','Edo','Reina','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',2),
	('Francisco','','Reig','Rosel',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',7),
	('Marina','Botella','','Sandoval',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',5),
	('Maria','Mar','Espinola','Barrios',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',9),
	('Alisson','Nicole','','Barrios',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',14),
	('Maria','Jesús','Piquer','Verdu',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',14),
	('Maria','Dolores','Doblas','Rozas',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',24),
	('Julia','','Tebar','Matute',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',44),
	('Natalia','','Piñero','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',48),
	('Jesus','','Areas','Antón',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',88),
	('Lucas','Mateo','','Carvajal',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',5),
	('Karim','Bencema','','Rebollo',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',6),
	('Amina','','Perera','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',3),
	('Juan','Muguiel','Ordoñes','Galindo',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',2),
	('Juan','Carlos','Algeles','Abellan',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',1),
	('Oscar','Juaquin','Ballester','Bustillo',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',40),
	('José','Julian','','Sosa',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',34),
	('Salvador','Nasrrala','de los Santos','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',41),
	('Kilian','','Galindo','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',44),
	('Pedro','Pablo','España','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',46),
	('Juan','Pablo','Madrid','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',57),
	('Luis','Alfredo','del Gallo','Fuentes',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',14),
	('José','Patricio','Sevilla','de los Lagos',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',20),
	('Anastacio','Policarpio','Galindes','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',9),
	('Marcos','Orlando','Sertas','Padilla',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',7),
	('Zaira','','San Juan','De la Cruz',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',90),
	('Avelino','','Escobar','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',97),
	('Juan','Manuel','Nuez','Gonzales',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',82),
	('Jorge','Enrique','Clemente','Camacho',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',82),
	('Maria','Esteban','Salgado','Cruz',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',82)
GO
--Agregada el 31/10/2021
INSERT INTO HUMAN_R.PERSON(var_firstName,var_secondName,var_firstSurname, var_secondSurname,var_DNI,var_RTN_Personal,dat_dateOfBirth,cha_gender,big_address_id_FK) VALUES
	('Kennhet','Daniel','Carcamo','Osorio',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Maribel','','de la Selva','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Carlos','Arriega','Salvarada','Peña',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Nieto','Francisco','Alvarez','Pinto',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Betty','Sofia','Carvajal','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Juan','Orlando','Velazques','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Aura','Marcela','Goso','Vasquez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Groria','Patricia','Angulo','Rick',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Felipe','Entrada','Por Salida','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Eurices','Galas','de Galardo','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Dacil','Esmeralda','Rios','Valle',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Tutela','','','de la Rada',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Mira','Inez','Talo','Garza',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Julia','Lineth','Cordoba','Bustillo',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Bertha','Alfaro','de la Fuente','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Sintia','Jesús','Alvarenga','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Maria','Alva','de Jesus','Otoro',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Martha','Emili','Tebar','Cruz',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Maria','Solano','Helix','Paz',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Nelson','','Carcamo','Valladares',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Luis','Enrique','Galo','Murillo',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Aura','María','de la Cruz','Valencia',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Roberto','Carlos','Braga','Moreira',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Carlos','Augusto','Ribera','Guerra',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Carila','Serco','Fuente','Galiano',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Isabel','','Bustillo','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Rodolfo','Enrique','Cabral','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Emiliano','Zapata','Salazar','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Porfilio','','Lobo','Sosa',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Jorge','Benito','Lalo','Garza',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Sofia','Victoria','del Ramal','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Alfredo','Ulises','Caballos','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Benito','Pablo','Juares','García',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Yannick','Ferreira','Galindes','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Florentino','Peres','Rodriguez','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Kevin','','Enrique','Valencia',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Eugenio','','Gonzáles','Derbez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Sofia','Margarita','Victoria','Federica',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Daniel','Enrique','Sanchez','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Mario','José','Escoto','Pinto',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Valeria','Sofia','Alvarado','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Rodrigo','','Garcia','Davila',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Carlos','Daniel','Ponce','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Daniel','Abraham','Escoto','Murillo',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Alice','','Cardona','Alberto',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Meliza','','Cardona','Alberto',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Wilson','Helimar','Puerto','Miramar',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Ivonne','','Pineda','Boddeen',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Alexandra','Denise','Sanches','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Carlos','Enrique','','Santos',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Edgar','Obed','Caceres','Martinez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Dario','Roberto','Calix','Alvarado',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Stefany','Mariel','Cerrato','Rivas',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Roberto','Carlos','Erazo','Martinez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Gerardo','Javier','Espinal','Martinez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('David','Javier','Flores','Irias',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Antony','Yaret','Garcia','Gomez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Rony','Josue','Gomez','Oyuela',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1))
GO
--agregado el 01-11-2021
INSERT INTO HUMAN_R.PERSON(var_firstName,var_secondName,var_firstSurname, var_secondSurname,var_DNI,var_RTN_Personal,dat_dateOfBirth,cha_gender,big_address_id_FK) VALUES
	('Ricardo','Armando','Mendoza','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Declaracion','','de la Cruz','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Marco','Antonio','Galindo','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Mario','Urtiz','Calderon','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Gabriel','Arturo','Lanza','Pagoaga',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Ronmel','Josue','Lizardo','Guzman',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Mariela','Carolina','Martinez','Rodriguez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Carlos','Antonio','Medina','Campos',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Ana','Estefania','Mejía','Matamoros',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Walter','Alexis','Nuñes','Valladares',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('José','Guellermo','Ordoñes','Rosales',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Juan','Carlos','Osorto','Barahona',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Josue','Alexander','Paz','Alberto',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Julia','','Alberto','Paz',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Claudia','Melissa','Quezada','Bustillo',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Myrka','Giselle','Ramirez','Rodriguez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Alison','Giselle','Murillo','Barrios',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Mariana','Emili','Padilla','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Hairum','Tub','Galiano','Galiano',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Maria','Lopez','Perez','Perez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Laura','Benedetti','Galeano','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Hugo','Deliery','Paz','Humaña',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Bertha','Galan','Pinson','Pedreño',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Jose','Nicolas','Piñon','Guerra',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Francisco','Antonio','Robles','Alvarenga',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Karina','Ivonne','Ruiz','MC Carthy',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Ileana','Pamela','Salazar','Rodriguez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Luis','Fernando','Sauceda','Gonzales',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Oscar','Andres','Velasquez','Ordoñez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Daniela','Leticia','Villeda','Monge',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Jose','Alejandro','Zavaleta','Elvir',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Alex','Jaffet','Bonilla','Raudalez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Fabio','Eduardo','Caballero','Pineda',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Dario','Roberto','Caux','Alvarado',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Marilin','Roxana','Rueda','Flores',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Olvin','Lenin','Lagos','Andino',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Ligia','Mercedes','Montes','Zuniga',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Sofia','Esperanza','Victoria','Cruz',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Lisandro','Alberto','Salgado','Villarta',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Angela','Yasmin','Valleriano','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Yaakov','Arturo','Obando','Bueso',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Eduardo','Rodrigo','Garcia','Andino',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Ana','Elena','Escamilla','Andino',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Pedro','Salazar','Andino','Cruz',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Alice','Obed','Padilla','Flores',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Carlos','Onan','Lagos','Martinez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Cristian','Vicente','Puerto','Zuniga',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Erick','Fabianny','Samayoa','Osorio',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Celvin','	Gerardo','Rodriguez','Orellana',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Carlos','Enrique','','Santos',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Luis','Ernesto','Orellana','Lagos',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Dario','Ernesto','Calix','Embajada',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Olvin','Fonseca','Alvarado','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Catalina','Loarca','Ramera','de Mayo',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Yudi','Saret','Tejeda','Murillo',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1))
GO
--agregado el 01-11-2021
INSERT INTO HUMAN_R.PERSON(var_firstName,var_secondName,var_firstSurname, var_secondSurname,var_DNI,var_RTN_Personal,dat_dateOfBirth,cha_gender,big_address_id_FK) VALUES
	('Carlos','Armando','Maradona','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Maria','Eugenia','Margarita','Hernandez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Carlos','','Zaragoza','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Flavio','Gale','Urtís','Barahona',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Luis','Miguel','Lanza','Pedrasco',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Ronmel','Quioto','Laraman','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Daniela','Michelle','Mirabel','Lagos',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Julio','Antonio','Mercedes','Peña',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Vivi','Maria','Murillo','Escobar',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('José','Emilio','Hemiliano','Cordoba',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Kevin','Alverto','Yuca','Paz',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('André','Marck','Montes','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Bolivar','','Paz','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Mario','','Venedeti','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Rosa','Daniela','Galo','Fuentes',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Flor','Maria','Campos','Araseli',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Ana','Anabel','Antón','Murillo',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Alejandra','','Valle','Santos',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Rojer','Fabricio','Espinoza','Velasquez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Genesis','Michelle','Vasquez','Vasquez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Glenda','Elisabeth','Galeano','Fuentes',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Fredy','José','de la Paz','Robles',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Andrea','Nicolle','Pajuada','Hernandez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Cristian','Ulet','Carbajal','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Bayron','Elvir','Valladares','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Perla','Liseth','Cruz','Barrios',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Karina','Michelle','Toledo','Albarado',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('David','','Urtecho','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Jorge','Alverto','Valle','Solorzano',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Fabiola','Michelle','Villeda','Moralles',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Marco','Rogelio','Zapata','Gales',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Fabricio','','Caray','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Josue','Stiven','Caballero','de la Barca',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Juan','Eduardo','Aragon','Diaz',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Sofia','Victoria','Rueda','Alvares',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Ely','Daniel','Lagos','Andino',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Lucia','Victoria','Paz','Solano',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Darian','Mati','Leon','López',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Yimi','Ruis','Ríos','Gutierrez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Estefania','Rosa','Santillano','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Freddy','Arturo','Pineda','Hernandez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Jefferson','Jose','Sandia','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Samanta','Saman','Pizarro','Merentes',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Pablo','Dario','Escobar','Murillo',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Carolina','Maria','Hernandez','Hernandez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Gustavo','Josue','Gusmán','Rivera',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Josue','Ivan','Molina','Mena',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Andy','Rojer','Estabilo','Torres',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Esteban','','Jimenez','Calderon',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Kevin','Angelo','Rosio','Jimenez',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Juan','José','Ortíz','Albornoz',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Omar','Alessandro','Medina','Calix',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Miguel','Angel','Larios','Campos',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Felipe','Eduardo','Mora','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'M',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1)),
	('Betzabeth','Saphire','Morales','',dbo.fnCustomPass(13,'N'),dbo.fnCustomPass(14,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'), 'F',FLOOR(( SELECT rnd FROM vwRandom ) *(110-1)+1))
GO
--SELECT * FROM HUMAN_R.PERSON
--DBCC CHECKIDENT ('HUMAN_R.PERSON', RESEED, 203)
--DELETE FROM HUMAN_R.PERSON WHERE big_person_id_PK>203


--DBCC CHECKIDENT ('HUMAN_R.SALARY', RESEED, 88)
--DELETE FROM HUMAN_R.SALARY WHERE int_salary_id_PK>88
--select * from HUMAN_R.SALARY
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES 
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),6),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),6),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),6),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),7),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),3),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),7),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),3),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),2),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),2),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),6),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),6),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1)
GO
--Agregados el 29/10/2021 SELECT * FROM HUMAN_R.SALARY
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES 
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),8),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),8),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),8),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4)
GO
--Agregados el 31/10/2021 SELECT * FROM HUMAN_R.SALARY
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES 
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5)
GO
--Agregados el 1/11/2021 SELECT * FROM HUMAN_R.SALARY
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES 
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5)
GO
--Agregados el 2/11/2021 SELECT * FROM HUMAN_R.SALARY
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES 
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),5),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),9),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),9),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),9),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),9),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4),
    (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),6)
GO

--DELETE HUMAN_R.EMPLOYEES WHERE int_employee_id_PK>68
--ALTER TABLE HUMAN_R.EMPLOYEES ADD CONSTRAINT EMPLOYEES_CODE UNIQUE(var_code)
--SELECT * FROM HUMAN_R.EMPLOYEES
--DBCC CHECKIDENT ('HUMAN_R.EMPLOYEES', RESEED, 68)
BEGIN TRY 
INSERT INTO HUMAN_R.EMPLOYEES(var_code,tin_branch_id_FK,tin_area_id_FK,int_contract_id_FK,big_person_id_FK) VALUES
	(dbo.fnCustomPass(10,'CN'),1,6,1,10),
	(dbo.fnCustomPass(10,'CN'),1,1,2,14),
	(dbo.fnCustomPass(10,'CN'),2,6,3,20),
	(dbo.fnCustomPass(10,'CN'),2,6,4,40),
	(dbo.fnCustomPass(10,'CN'),1,1,5,25),
	(dbo.fnCustomPass(10,'CN'),2,1,6,13),
	(dbo.fnCustomPass(10,'CN'),3,1,7,39),
	(dbo.fnCustomPass(10,'CN'),4,1,8,99),
	(dbo.fnCustomPass(10,'CN'),5,1,9,98),
	(dbo.fnCustomPass(10,'CN'),6,1,10,87),
	(dbo.fnCustomPass(10,'CN'),3,4,11,65),
	(dbo.fnCustomPass(10,'CN'),1,1,12,43),
	(dbo.fnCustomPass(10,'CN'),2,1,13,76),
	(dbo.fnCustomPass(10,'CN'),3,4,14,70),
	(dbo.fnCustomPass(10,'CN'),4,4,15,47),
	(dbo.fnCustomPass(10,'CN'),9,4,16,21),
	(dbo.fnCustomPass(10,'CN'),8,1,17,67),
	(dbo.fnCustomPass(10,'CN'),7,1,18,92),
	(dbo.fnCustomPass(10,'CN'),6,7,19,95),
	(dbo.fnCustomPass(10,'CN'),5,1,20,100),
	(dbo.fnCustomPass(10,'CN'),6,3,21,35),
	(dbo.fnCustomPass(10,'CN'),7,7,22,50),
	(dbo.fnCustomPass(10,'CN'),2,3,23,59),
	(dbo.fnCustomPass(10,'CN'),4,2,24,55),
	(dbo.fnCustomPass(10,'CN'),8,2,25,9),
	(dbo.fnCustomPass(10,'CN'),9,6,26,5),
	(dbo.fnCustomPass(10,'CN'),5,6,27,81),
	(dbo.fnCustomPass(10,'CN'),4,1,28,85)
END TRY  
BEGIN CATCH  
    
END CATCH; 
go
--Agregado el 29/10/2021 
BEGIN TRY 
INSERT INTO HUMAN_R.EMPLOYEES(var_code,tin_branch_id_FK,tin_area_id_FK,int_contract_id_FK,big_person_id_FK) VALUES
	(dbo.fnCustomPass(10,'CN'),1,1,29,105),
	(dbo.fnCustomPass(10,'CN'),2,1,30,130),
	(dbo.fnCustomPass(10,'CN'),3,1,31,120),
	(dbo.fnCustomPass(10,'CN'),4,1,32,110),
	(dbo.fnCustomPass(10,'CN'),5,1,33,115),
	(dbo.fnCustomPass(10,'CN'),6,1,34,125),
	(dbo.fnCustomPass(10,'CN'),7,1,35,135),
	(dbo.fnCustomPass(10,'CN'),8,1,36,140),
	(dbo.fnCustomPass(10,'CN'),9,1,37,111),
	(dbo.fnCustomPass(10,'CN'),6,8,38,129),
	(dbo.fnCustomPass(10,'CN'),9,8,39,104),
	(dbo.fnCustomPass(10,'CN'),8,8,40,108),
	(dbo.fnCustomPass(10,'CN'),7,4,41,134),
	(dbo.fnCustomPass(10,'CN'),6,4,42,139),
	(dbo.fnCustomPass(10,'CN'),5,1,43,114),
	(dbo.fnCustomPass(10,'CN'),4,1,44,124),
	(dbo.fnCustomPass(10,'CN'),1,5,45,127),
	(dbo.fnCustomPass(10,'CN'),2,5,46,137),
	(dbo.fnCustomPass(10,'CN'),6,1,47,117),
	(dbo.fnCustomPass(10,'CN'),9,4,48,141)
END TRY  
BEGIN CATCH  
    
END CATCH; 
go
--Agregado el 31/10/2021 
BEGIN TRY 
INSERT INTO HUMAN_R.EMPLOYEES(var_code,tin_branch_id_FK,tin_area_id_FK,int_contract_id_FK,big_person_id_FK) VALUES
	(dbo.fnCustomPass(10,'CN'),1,1,49,149),
	(dbo.fnCustomPass(10,'CN'),2,1,50,159),
	(dbo.fnCustomPass(10,'CN'),3,1,51,169),
	(dbo.fnCustomPass(10,'CN'),4,1,52,179),
	(dbo.fnCustomPass(10,'CN'),5,1,53,189),
	(dbo.fnCustomPass(10,'CN'),6,1,54,199),
	(dbo.fnCustomPass(10,'CN'),7,1,55,202),
	(dbo.fnCustomPass(10,'CN'),8,1,56,200),
	(dbo.fnCustomPass(10,'CN'),9,1,57,146),
	(dbo.fnCustomPass(10,'CN'),7,4,58,156),
	(dbo.fnCustomPass(10,'CN'),1,5,59,166),
	(dbo.fnCustomPass(10,'CN'),2,4,60,176),
	(dbo.fnCustomPass(10,'CN'),3,4,61,186),
	(dbo.fnCustomPass(10,'CN'),4,1,62,196),
	(dbo.fnCustomPass(10,'CN'),5,1,63,147),
	(dbo.fnCustomPass(10,'CN'),6,4,64,155),
	(dbo.fnCustomPass(10,'CN'),7,5,65,177),
	(dbo.fnCustomPass(10,'CN'),6,5,66,188),
	(dbo.fnCustomPass(10,'CN'),5,5,67,197),
	(dbo.fnCustomPass(10,'CN'),4,5,68,153)
END TRY  
BEGIN CATCH  
    
END CATCH; 
go
--Agregado el 1/11/2021 
BEGIN TRY 
INSERT INTO HUMAN_R.EMPLOYEES(var_code,tin_branch_id_FK,tin_area_id_FK,int_contract_id_FK,big_person_id_FK) VALUES
	(dbo.fnCustomPass(10,'CN'),1,1,69,258),
	(dbo.fnCustomPass(10,'CN'),2,1,70,205),
	(dbo.fnCustomPass(10,'CN'),3,1,71,210),
	(dbo.fnCustomPass(10,'CN'),4,1,72,220),
	(dbo.fnCustomPass(10,'CN'),5,1,73,230),
	(dbo.fnCustomPass(10,'CN'),6,1,74,240),
	(dbo.fnCustomPass(10,'CN'),7,1,75,250),
	(dbo.fnCustomPass(10,'CN'),8,1,76,207),
	(dbo.fnCustomPass(10,'CN'),9,1,77,217),
	(dbo.fnCustomPass(10,'CN'),3,4,78,227),
	(dbo.fnCustomPass(10,'CN'),4,5,79,237),
	(dbo.fnCustomPass(10,'CN'),5,4,80,247),
	(dbo.fnCustomPass(10,'CN'),1,4,81,257),
	(dbo.fnCustomPass(10,'CN'),2,1,82,215),
	(dbo.fnCustomPass(10,'CN'),3,1,83,225),
	(dbo.fnCustomPass(10,'CN'),4,4,84,235),
	(dbo.fnCustomPass(10,'CN'),5,5,85,245),
	(dbo.fnCustomPass(10,'CN'),4,5,86,255),
	(dbo.fnCustomPass(10,'CN'),5,5,87,231),
	(dbo.fnCustomPass(10,'CN'),6,5,88,211)
END TRY  
BEGIN CATCH  
    
END CATCH; 
go
--Agregado el 2/11/2021 
BEGIN TRY 
INSERT INTO HUMAN_R.EMPLOYEES(var_code,tin_branch_id_FK,tin_area_id_FK,int_contract_id_FK,big_person_id_FK) VALUES
	(dbo.fnCustomPass(10,'CN'),1,5,89,260),
	(dbo.fnCustomPass(10,'CN'),2,5,90,313),
	(dbo.fnCustomPass(10,'CN'),3,5,91,270),
	(dbo.fnCustomPass(10,'CN'),4,5,92,280),
	(dbo.fnCustomPass(10,'CN'),5,5,93,290),
	(dbo.fnCustomPass(10,'CN'),6,5,94,300),
	(dbo.fnCustomPass(10,'CN'),7,5,95,310),
	(dbo.fnCustomPass(10,'CN'),8,5,96,267),
	(dbo.fnCustomPass(10,'CN'),9,5,97,277),
	(dbo.fnCustomPass(10,'CN'),2,9,98,287),
	(dbo.fnCustomPass(10,'CN'),3,9,99,297),
	(dbo.fnCustomPass(10,'CN'),4,9,100,307),
	(dbo.fnCustomPass(10,'CN'),1,9,101,265),
	(dbo.fnCustomPass(10,'CN'),2,4,102,275),
	(dbo.fnCustomPass(10,'CN'),3,4,103,285),
	(dbo.fnCustomPass(10,'CN'),4,4,104,295),
	(dbo.fnCustomPass(10,'CN'),5,4,105,305),
	(dbo.fnCustomPass(10,'CN'),6,4,106,308),
	(dbo.fnCustomPass(10,'CN'),4,4,107,302),
	(dbo.fnCustomPass(10,'CN'),5,6,108,263)
END TRY  
BEGIN CATCH  
    
END CATCH; 
go

--delete from HUMAN_R.SALARY_EMP
--SELECT * FROM HUMAN_R.SALARY_EMP
INSERT INTO HUMAN_R.SALARY_EMP(bit_pay,int_salary_id_FK,int_employee_id_FK) values
	(1,1,1),
	(1,2,2),
	(1,3,3),
	(1,4,4),
	(1,5,5),
	(1,6,6),
	(1,7,7),
	(1,8,8),
	(1,9,9),
	(1,10,10),
	(1,11,11),
	(1,12,12),
	(1,13,13),
	(1,14,14),
	(1,15,15),
	(1,16,16),
	(1,17,17),
	(1,18,18),
	(1,19,19),
	(1,20,20),
	(1,21,21),
	(1,22,22),
	(1,23,23),
	(1,24,24),
	(1,25,25),
	(1,26,26),
	(1,27,27)
GO
--agragada el 29/10/2021 SELECT * FROM HUMAN_R.SALARY_EMP
INSERT INTO HUMAN_R.SALARY_EMP(bit_pay,int_salary_id_FK,int_employee_id_FK) values
	(1,28,28),
	(1,29,29),
	(1,30,30),
	(1,31,31),
	(1,32,32),
	(1,33,33),
	(1,34,34),
	(1,35,35),
	(1,36,36),
	(1,37,37),
	(1,38,38),
	(1,39,39),
	(1,40,40),
	(1,41,41),
	(1,42,42),
	(1,43,43),
	(1,44,44),
	(1,45,45),
	(1,46,46),
	(1,47,47),
	(1,48,48)
GO
--agragada el 31/10/2021 SELECT * FROM HUMAN_R.SALARY_EMP
INSERT INTO HUMAN_R.SALARY_EMP(bit_pay,int_salary_id_FK,int_employee_id_FK) values
	(1,49,49),
	(1,50,50),
	(1,51,51),
	(1,52,52),
	(1,53,53),
	(1,54,54),
	(1,55,55),
	(1,56,56),
	(1,57,57),
	(1,58,58),
	(1,59,59),
	(1,60,60),
	(1,61,61),
	(1,62,62),
	(1,63,63),
	(1,64,64),
	(1,65,65),
	(1,66,66),
	(1,67,67),
	(1,68,68)
GO
--agragada el 1/11/2021 SELECT * FROM HUMAN_R.SALARY_EMP
INSERT INTO HUMAN_R.SALARY_EMP(bit_pay,int_salary_id_FK,int_employee_id_FK) values
	(1,69,69),
	(1,70,70),
	(1,71,71),
	(1,72,72),
	(1,73,73),
	(1,74,74),
	(1,75,75),
	(1,76,76),
	(1,77,77),
	(1,78,78),
	(1,79,79),
	(1,80,80),
	(1,81,81),
	(1,82,82),
	(1,83,83),
	(1,84,84),
	(1,85,85),
	(1,86,86),
	(1,87,87),
	(1,88,88)
GO
--agragada el 2/11/2021 SELECT * FROM HUMAN_R.SALARY_EMP
INSERT INTO HUMAN_R.SALARY_EMP(bit_pay,int_salary_id_FK,int_employee_id_FK) values
	(1,89,89),
	(1,90,90),
	(1,91,91),
	(1,92,92),
	(1,93,93),
	(1,94,94),
	(1,95,95),
	(1,96,96),
	(1,97,97),
	(1,98,98),
	(1,99,99),
	(1,100,100),
	(1,101,101),
	(1,102,102),
	(1,103,103),
	(1,104,104),
	(1,105,105),
	(1,106,106),
	(1,107,107),
	(1,108,108)
GO

--SELECT * FROM HUMAN_R.TELEPHONES
--DBCC CHECKIDENT ('HUMAN_R.TELEPHONES', RESEED, 0)
--DELETE FROM HUMAN_R.TELEPHONES
BEGIN TRY  
    INSERT INTO HUMAN_R.TELEPHONES(var_number,big_person_id_FK,int_country_id_FK) VALUES
	(dbo.fnCustomPass(8,'N'),FLOOR(( SELECT rnd FROM vwRandom ) *(313-260)+260),1),
	(dbo.fnCustomPass(8,'N'),FLOOR(( SELECT rnd FROM vwRandom ) *(313-260)+260),2),
	(dbo.fnCustomPass(8,'N'),FLOOR(( SELECT rnd FROM vwRandom ) *(313-260)+260),3)
END TRY  
BEGIN CATCH  
    
END CATCH; 
go

--SELECT * FROM HUMAN_R.PAYMENT_MOVEMENT
BEGIN TRY  
	INSERT INTO HUMAN_R.PAYMENT_MOVEMENT(bit_motionFactor,int_movement_id_PK_FK,int_salary_id_PK_FK) VALUES
		(1,FLOOR(( SELECT rnd FROM vwRandom ) *(13-1)+1),FLOOR(( SELECT rnd FROM vwRandom ) *(108-89)+89)),
		(1,FLOOR(( SELECT rnd FROM vwRandom ) *(13-1)+1),FLOOR(( SELECT rnd FROM vwRandom ) *(108-89)+89)),
		(1,FLOOR(( SELECT rnd FROM vwRandom ) *(13-1)+1),FLOOR(( SELECT rnd FROM vwRandom ) *(108-89)+89)),
		(1,FLOOR(( SELECT rnd FROM vwRandom ) *(13-1)+1),FLOOR(( SELECT rnd FROM vwRandom ) *(108-89)+89)),
		(1,FLOOR(( SELECT rnd FROM vwRandom ) *(13-1)+1),FLOOR(( SELECT rnd FROM vwRandom ) *(108-89)+89)),
		(1,FLOOR(( SELECT rnd FROM vwRandom ) *(13-1)+1),FLOOR(( SELECT rnd FROM vwRandom ) *(108-89)+89))
END TRY  
BEGIN CATCH  
    
END CATCH; 
go

--DELETE FROM HUMAN_R.EXTRA_HOURS
--SELECT * FROM HUMAN_R.EXTRA_HOURS
--DBCC CHECKIDENT ('HUMAN_R.EXTRA_HOURS', RESEED, 71)
BEGIN TRY 
INSERT INTO HUMAN_R.EXTRA_HOURS(dat_date,tin_amount,bit_payFactor,tin_hourType_id_FK,int_salary_id_FK) VALUES
	(dbo.getRandomDate('2020-12-01', '2020-12-31'),1,1,(FLOOR(( SELECT rnd FROM vwRandom ) *(9-1)+1)),(FLOOR(( SELECT rnd FROM vwRandom ) *(108-89)+89))),
	(dbo.getRandomDate('2020-12-01', '2020-12-31'),1,1,(FLOOR(( SELECT rnd FROM vwRandom ) *(9-1)+1)),(FLOOR(( SELECT rnd FROM vwRandom ) *(108-89)+89))),
	(dbo.getRandomDate('2020-12-01', '2020-12-31'),1,1,(FLOOR(( SELECT rnd FROM vwRandom ) *(9-1)+1)),(FLOOR(( SELECT rnd FROM vwRandom ) *(108-89)+89))),
	(dbo.getRandomDate('2020-12-01', '2020-12-31'),1,1,(FLOOR(( SELECT rnd FROM vwRandom ) *(9-1)+1)),(FLOOR(( SELECT rnd FROM vwRandom ) *(108-89)+89))),
	(dbo.getRandomDate('2020-12-01', '2020-12-31'),1,1,(FLOOR(( SELECT rnd FROM vwRandom ) *(9-1)+1)),(FLOOR(( SELECT rnd FROM vwRandom ) *(108-89)+89)))
END TRY  
BEGIN CATCH  
    
END CATCH; 
go