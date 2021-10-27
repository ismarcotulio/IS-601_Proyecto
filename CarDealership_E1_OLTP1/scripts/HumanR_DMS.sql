USE CarDealership_E1_OLTP1;
INSERT INTO HUMAN_R.TYPE_HOURS(flo_porcent,var_name) VALUES (130,'Dia de semana/Mañana');
INSERT INTO HUMAN_R.TYPE_HOURS(flo_porcent,var_name) VALUES (150,'Dia de semana/Tarde');
INSERT INTO HUMAN_R.TYPE_HOURS(flo_porcent,var_name) VALUES (180,'Dia de semana/Noche');
INSERT INTO HUMAN_R.TYPE_HOURS(flo_porcent,var_name) VALUES (170,'Fin de semana/Sabado/Mañana');
INSERT INTO HUMAN_R.TYPE_HOURS(flo_porcent,var_name) VALUES (180,'Fin de semana/Sabado/Tarde');
INSERT INTO HUMAN_R.TYPE_HOURS(flo_porcent,var_name) VALUES (190,'Fin de semana/Sabado/Noche');
INSERT INTO HUMAN_R.TYPE_HOURS(flo_porcent,var_name) VALUES (190,'Fin de semana/Domingo/Mañana');
INSERT INTO HUMAN_R.TYPE_HOURS(flo_porcent,var_name) VALUES (195,'Fin de semana/Domingo/Tarde');
INSERT INTO HUMAN_R.TYPE_HOURS(flo_porcent,var_name) VALUES (200,'Fin de semana/Domingo/Noche');

INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES ('Costo de vida',1,5000);
INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES ('Aumento de salario minimo',1,2000);
INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES ('Comision por ventas',1,1000);
INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES ('Aumento por los Plus',1,4500);
INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES ('Bono de transporte cada 6',1,3000);
INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES ('Bono de vacaciones',1,1300);
INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES ('Licencia por maternidad',1,1500);
INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES ('CITRAMOVIL',-1,3400);
INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES ('Seguro social IHHSS',-1,1200);
INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES ('Indemnizaciones por traslados',-1,1000);
INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES ('Indemnizaciones por suspensiones',-1,1300);
INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES ('Indemnizaciones por despido',-1,2500);
INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES ('Pagos a cooperativas de ahorro',-1,900);

INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Gerente de Venta');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Supervisor de Venta');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Servicio al Cliente');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Director de Operaciones');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Director Ejecutivo');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Director de Marketing');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Director Comercial');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Director de Recursos Humanos');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Ingeniero en sistemas');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Operario');
INSERT INTO HUMAN_R.POSITION(var_name) VALUES ('Mecanico');
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
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Finanzas');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Administracion');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Marketing');
INSERT INTO HUMAN_R.AREA(var_name) VALUES ('Area General de Compras');

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

SELECT * FROM HUMAN_R.SUBURN

DBCC CHECKIDENT ('HUMAN_R.SUBURN', RESEED, 0)
SELECT * FROM HUMAN_R.SUBURN
DELETE FROM HUMAN_R.SUBURN
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

SELECT * FROM HUMAN_R.SUBURN ORDER BY big_suburn_id_PK
ALTER TABLE HUMAN_R.SUBURN ADD CONSTRAINT SUBURN_Unique UNIQUE(var_name,big_city_id_FK);

INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,1); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,2); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,3); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('A una cuadra del Hospital San Jorge',1,1,1,4); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Boulevard CentroAmerica, Contigo a Equipos Industriales',1,1,1,5); --5 Sucursal Tegucigalpa
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Cuarta etapa, Covespul',1,1,1,6); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,7); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,8); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,9); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,10); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,11); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('A la par de la iglecia Hossana',1,1,1,12); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,13); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,14); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,15); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,16); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,17); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,18); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,19); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,20); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,1,21);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('A tres casas de la escuela Paraguay',1,1,1,22);
--tegucigalpa 1/1 nos da hasta el 1
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,2,23); 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,2,24);
--Cedros 1/1 nos da hasta el 2
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,3,25);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,3,26);
--Talanga 1/1 nos da hasta el 3
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,6,27);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,6,28);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,6,29);
--Ojojona 1/1 nos da hasta el 6
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,1,7,30);
--El porvenir 1/1 nos da hasta el 7
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,8,31);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,8,32);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,8,33);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,8,34);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,8,35);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,8,36);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,9,37);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,9,38);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,11,39);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,11,40);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,11,41);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,11,42);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,12,43);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,12,44);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,12,45);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,12,46);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,12,47);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,12,48);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,12,49);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,12,50);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Al par de Hotel America',1,2,12,51);--sucursal 51 Comayagua
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,12,52);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,12,53);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,2,12,54);
--Comayagua 2 nos da hasta 12
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,13,55);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,13,56);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,13,57);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,13,58);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,13,59);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,13,60);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,13,61);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,13,62);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,13,63);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,13,64);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,13,65);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,13,66);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,17,67);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,17,68);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,17,69);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,17,70);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Frente a la iglesia Catolica de San Isidro',1,3,17,71);--sucursal 71 Cortes
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,3,19,72);
--Cortes 3 nos da hasta 
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,4,22,73);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,4,22,74);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,4,22,75);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,4,22,76);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,4,22,77);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,4,22,78);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('En frente de la Iglesia Catolica San Juan Pablo II',1,4,22,79);--Sucursal 79 Choluteca
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,4,22,80);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,4,22,81);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,4,22,82);
--Choluteca 4 nos hasta 22
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,5,25,83);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,5,25,84);
--Copan 5 nos hasta 25
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,6,29,85);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,6,29,86);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,6,29,87);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,6,29,88);
--Intibuca 6 nos hasta 29
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,7,33,89);
--Ocotepeque 7 nos hasta 33
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,8,37,90);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,8,37,91);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,8,37,92);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,8,37,93);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,8,37,94);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,8,37,95);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',1,8,37,96);
--Olancho 8 nos hasta 37
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',2,11,42,97);
--Nord 11/ 2 nos hasta 42
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',4,15,45,98);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',4,15,45,99);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',4,15,45,100);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('A tres casas del Hospital Venecia 103',4,15,45,101);--sucursal 101
--Villa clara 15/ 4 hasta 45
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',4,17,51,102);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',4,17,51,103);
--Santiago de Cuba 17/ 4  hasta el 51
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',5,17,53,104);
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('A la par de pizzeria Victoria, calle 249',5,17,53,105);--Sucursal 105 limon Costa rica
--Pococi 19/ 5   hasta el 53
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Entre el parque José María Cordoba, al par de la tienda de Isa',7,29,66,106);--sucursal 106  Cordoba, Colombia
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',7,29,66,107);
--Valencia 29/ 7  hasta el 66
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Sin datos',11,46,89,108);
--Madrid 46/ 11 hasta el 89
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Iglesia la Palabra que Cambia',9,36,74,109); --Sucursal 109 Santa Ana el Salvador
--Santa Ana  36/9 hasta el 74
INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('Frente al Empalame el Crusero',10,44,82,110);--Sucursal 110
--Managua 44/10 hasta el 110

SELECT * FROM HUMAN_R.LIST_ADDRESS

INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (1,'Sucursal de Tegucigalpa',5);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (2,'Sucursal de Comayagua',51);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (3,'Sursal de Cortes',71);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (4,'Sursal de Choluteca',79);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (5,'Sursal de Villa Clara, Cuba',101);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (6,'Sursal de Limon, Costa Rica',105);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (7,'Sursal de Cordoba, Colombia',106);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (8,'Sursal de Santa Ana, El Salvador',109);
INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (9,'Sursal de Cortes',110);

INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary,dat_date,bit_pay,tin_area_id_FK) VALUES (0,0,5);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,1);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,2);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,9);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,3);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,3);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,3);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,3);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,3);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,3);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,4);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,11);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,11);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,11);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,11);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,10);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,10);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,10);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,6);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,7);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,8);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,12);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,12);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,12);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,12);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,12);
INSERT INTO HUMAN_R.SALARY(mon_netSalary,mon_hourSalary) VALUES (0,0,12);