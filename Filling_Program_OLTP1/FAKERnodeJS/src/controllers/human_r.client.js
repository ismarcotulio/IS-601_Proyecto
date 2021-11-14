import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getClient = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM HUMAN_R.CLIENT")
    //console.log(result)
    res.json(result.recordset)
};

export const newClient = async (req, res) => {
    const pool = await getConnection();
    let con = 1;
    while(con <= 40000){
        await pool.request()
        .query("INSERT INTO HUMAN_R.CLIENT(big_client_id_PK,var_code,var_RTN_Personal) VALUES ("
        +con+",dbo.fnCustomPass(20,'CN'),dbo.fnCustomPass(14,'CN'))");
        console.log(con+"->40000")
        con++;   
    }
    
    pool.close;
    res.json("Succeses: Client data") 
};