import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getClient = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM CLIENT")
    //console.log(result)
    res.json(result.recordset)
};

export const newClient = async (req, res) => {
    console.log("Generating CLIENT");
    const pool = await getConnection();
    let con = 1;
    await pool.request()
    .query("USE CarDealership_OLTP1");
    while(con <= 40000){
        await pool.request()
        .query("INSERT INTO CLIENT(big_client_id_PK,var_code,var_RTN_Personal) VALUES ("
        +con+",dbo.fnCustomPass(20,'CN'),dbo.fnCustomPass(14,'N'))");
        con++;   
    }
    
    pool.close;
    res()
};