import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getT_person = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM TELEPHONES_PERSON")
    //console.log(result)
    res.json(result.recordset)
};

export const newT_person = async (req, res) => {
    console.log("Generating TELEPHONES_PERSON");
    const pool = await getConnection();
    let con = 1;
    while(con <= 37000){
        await pool.request()
        .query("INSERT INTO TELEPHONES_PERSON(bit_active,big_person_id_FK,big_telephon_id_FK) VALUES (1,"
        +con+"," 
        +con+")");
        con++;   
    }
    
    pool.close;
    res()  
};