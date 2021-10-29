USE OLPT_E1
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

INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2012/12/12',1,5,24000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2012/12/12',1,1,15000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2013/11/15',1,2,14000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2013/10/22',1,9,12000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2014/09/24',1,3,9000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2017/01/13',1,3,9000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2016/07/11',1,3,9000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2014/06/09',0,3,9000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2015/04/01',1,3,9000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2013/11/05',1,3,9000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2014/02/16',1,4,14000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2013/10/23',0,11,8500);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2012/07/29',1,11,8500);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2014/11/30',1,11,8500);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2014/04/30',1,11,8500);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2015/08/04',1,10,8000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2014/12/16',1,10,8000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2016/10/11',1,10,8000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2019/06/10',1,6,15000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2020/07/09',1,7,14000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2014/01/07',1,8,12000);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2012/11/11',1,12,8500);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2016/12/12',1,12,9500);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2017/09/13',1,12,8500);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2021/03/26',0,12,8500);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2015/04/27',1,12,8400);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2019/08/05',1,12,9500);
INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES ('2017/11/21',1,9,12000);

INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Ventas');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Finanzas');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Recursos Humanos');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Logistica');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Finanzas');--editar
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Administracion');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Marketing');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Compras');
go

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

INSERT INTO HUMAN_R.PERSON(var_firstName,var_secondName,var_firstSurname, var_secondSurname,var_DNI,var_RTN_Personal,dat_dateOfBirth,cha_gender,big_address_id_FK) VALUES
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
	 

INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),6);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),6);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),6);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),4);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),7);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),3);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),7);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),3);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),2);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),2);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),6);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),6);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,tin_area_id_FK) VALUES (1,0,dbo.getRandomDate('2021-01-01', '2021-01-31'),1);
GO
--DELETE HUMAN_R.EMPLOYEES
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
GO

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

BEGIN TRY  
    INSERT INTO HUMAN_R.TELEPHONES(var_number,big_person_id_FK,int_country_id_FK) VALUES
	(dbo.fnCustomPass(8,'N'),FLOOR(( SELECT rnd FROM vwRandom ) *(105-4)+1),1),
	(dbo.fnCustomPass(8,'N'),FLOOR(( SELECT rnd FROM vwRandom ) *(105-4)+1),1),
	(dbo.fnCustomPass(8,'N'),FLOOR(( SELECT rnd FROM vwRandom ) *(105-4)+1),1),
	(dbo.fnCustomPass(8,'N'),FLOOR(( SELECT rnd FROM vwRandom ) *(105-4)+1),2),
	(dbo.fnCustomPass(8,'N'),FLOOR(( SELECT rnd FROM vwRandom ) *(105-4)+1),2),
	(dbo.fnCustomPass(8,'N'),FLOOR(( SELECT rnd FROM vwRandom ) *(105-4)+1),2),
	(dbo.fnCustomPass(8,'N'),FLOOR(( SELECT rnd FROM vwRandom ) *(105-4)+1),3),
	(dbo.fnCustomPass(8,'N'),FLOOR(( SELECT rnd FROM vwRandom ) *(105-4)+1),3)  
END TRY  
BEGIN CATCH  
    
END CATCH; 
go

BEGIN TRY  
	INSERT INTO HUMAN_R.PAYMENT_MOVEMENT(bit_motionFactor,int_movement_id_PK_FK,int_salary_id_PK_FK) VALUES
		(1,FLOOR(( SELECT rnd FROM vwRandom ) *(13-1)+1),7),
		(1,FLOOR(( SELECT rnd FROM vwRandom ) *(13-1)+1),8),
		(1,FLOOR(( SELECT rnd FROM vwRandom ) *(13-1)+1),9),
		(1,FLOOR(( SELECT rnd FROM vwRandom ) *(13-1)+1),10),
		(1,FLOOR(( SELECT rnd FROM vwRandom ) *(13-1)+1),11),
		(1,FLOOR(( SELECT rnd FROM vwRandom ) *(13-1)+1),12)
END TRY  
BEGIN CATCH  
    
END CATCH; 
go

BEGIN TRY 
INSERT INTO HUMAN_R.EXTRA_HOURS(dat_date,tin_amount,bit_payFactor,tin_hourType_id_FK,int_salary_id_FK) VALUES
	(dbo.getRandomDate('2020-12-01', '2020-12-31'),2,1,(FLOOR(( SELECT rnd FROM vwRandom ) *(18-1)+1)),(FLOOR(( SELECT rnd FROM vwRandom ) *(27-1)+1)));
END TRY  
BEGIN CATCH  
    
END CATCH; 
go