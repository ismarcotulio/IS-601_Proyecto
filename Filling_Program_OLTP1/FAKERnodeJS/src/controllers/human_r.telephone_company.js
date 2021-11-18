import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getT_Company = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM TELEPHONES_COMPANY")
    //console.log(result)
    res.json(result.recordset)
};

export const newT_Company = async (req, res) => {
    const pool = await getConnection();
    let con = 371;
    while(con <= 470){
        await pool.request()
        .query("INSERT INTO TELEPHONES_COMPANY(bit_active,int_company_id_FK,big_telephon_id_FK) VALUES (1,"
        +(con-370)+"," 
        +con+")");
        con++;   
    }
    
    pool.close;
    res() 
};