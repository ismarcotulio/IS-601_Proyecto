import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getT_Company = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM HUMAN_R.TELEPHONES_COMPANY")
    //console.log(result)
    res.json(result.recordset)
};

export const newT_Company = async (req, res) => {
    const pool = await getConnection();
    let con = 60001;
    while(con <= 70000){
        await pool.request()
        .query("INSERT INTO HUMAN_R.TELEPHONES_COMPANY(bit_active,big_company_id_FK,big_telephon_id_FK) VALUES (1,"
        +con-60000+"," 
        +con+")");
        console.log(con+"->70000")
        con++;   
    }
    
    pool.close;
    res.json("Succeses: T_Company data") 
};