import {getConnection} from '../database/connection'

export const dataFill = async (req, res) => {
    const pool = await getConnection();
    
    await pool.request()
    .query("INSERT INTO HUMAN_R.TYPE_HOURS(flo_porcent,var_name) VALUES (130,'Dia de semana/Mañana'),"
    +"(150,'Dia de semana/Tarde'),(180,'Dia de semana/Noche'),(170,'Fin de semana/Sabado/Mañana'),"
    +"(180,'Fin de semana/Sabado/Tarde'),(190,'Fin de semana/Sabado/Noche'),(190,'Fin de semana/Domingo/Mañana')"
    +",(195,'Fin de semana/Domingo/Tarde'),(200,'Fin de semana/Domingo/Noche')");
    await pool.request()
    .query("INSERT INTO HUMAN_R.MOVEMENT(tex_description,int_factor,mon_amount) VALUES ('Costo de vida',1,5000),"
    +" ('Aumento de salario minimo',1,2000), ('Comision por ventas',1,1000), ('Aumento por los Plus',1,4500), "
    +"('Bono de transporte cada 6',1,3000), ('Bono de vacaciones',1,1300), ('Licencia por maternidad',1,1500),"
    +" ('CITRAMOVIL',-1,3400), ('Seguro social IHHSS',-1,1200), ('Indemnizaciones por traslados',-1,1000), "
    +"('Indemnizaciones por suspensiones',-1,1300), ('Indemnizaciones por despido',-1,2500), "
    +"('Pagos a cooperativas de ahorro',-1,900)")
    await pool.request()
    .query("INSERT INTO HUMAN_R.COUNTRY VALUES (1,'Honduras','504'),"
    +"(2,'Cuba','53'), (3,'Costa Rica','506'), (4,'Colombia','57')"
    +", (5,'Salvador','503'), (6,'Nicaragua','505')")
    await pool.request()
    .query("INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('Francisco Morazán',1), "
    +"('Comayagua',1), ('Cortés',1), ('Choluteca',1), ('Villa Clara',2), ('Limón',3), ('Córdoba',4), "
    +"('Santa Ana',5), ('Managua',6)")
    await pool.request()
    .query("INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('Tegucigalpa',1), ('Comayagua',2),"
    +" ('San Pedro Sula',3), ('Choluteca',4), ('Santa Clara',5), ('Pococi',6), ('Valencia',7),('Santa Ana',8),"
    +" ('El Crucero',9)")
    await pool.request()
    .query("INSERT INTO HUMAN_R.SUBURN VALUES (1,'Colonia Kennedy',1), (2,'Barrio Torondon"
    +"',2), (3,'Colonia Satelite',3), (4,'Colonia Vanecia',4), (5,'Reparto Virginia',5), (6,'Los Lagos',6), (7,'Ensanche',7),"
    +" (8,'Socorro',8), (9,'Las Conchitas',9)")
    await pool.request()
    .query("INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK"
    +",big_suburn_id_FK) VALUES ('Boulevard CentroAmerica, Contigo a Equipos Industriales',1,1,1,1),"
    +"('Al par de Hotel America',1,2,2,2),('Frente a la iglesia Catolica de San Isidro',1,3,3,3),"
    +"('En frente de la Iglesia Catolica San Juan Pablo II',1,4,4,4),('A tres casas del Hospital Venecia 103',2,"
    +"5,5,5),('A la par de pizzeria Victoria, calle 249',3,6,6,6),('Entre el parque José María Cordoba, al par "
    +"de la tienda de Isa',4,7,7,7),('Iglesia la Palabra que Cambia',5,8,8,8),('Frente al Empalame el Crusero"
    +"',6,8,8,8)")
    await pool.request()
    .query("INSERT INTO HUMAN_R.BRANCH_OFFICES VALUES (1,'Sucursal de Tegucigalpa',1), (2,'Sucursal de Comayagua'"
    +",2), (3,'Sucursal de Cortes',3), (4,'Sucursal de Choluteca',4), (5,'Sucursal de Villa Clara, Cuba',5), "
    +"(6,'Sucursal de Limon, Costa Rica',6), (7,'Sucursal de Cordoba, Colombia',7), (8,'Sucursal de Santa Ana, "
    +"El Salvador',8), (9,'Sucursal de Managua, Nicaragua',9)")
    await pool.request()
    .query("INSERT INTO HUMAN_R.TELEPHONES_TYPE VALUES (1,'Empresarial'),(2,'Personal')")

    pool.close;
    res.json("Succeses: Inicial Data") 
};