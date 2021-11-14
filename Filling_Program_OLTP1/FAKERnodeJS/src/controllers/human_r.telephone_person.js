import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getT_person = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM HUMAN_R.TELEPHONES_PERSON")
    //console.log(result)
    res.json(result.recordset)
};

export const newT_person = async (req, res) => {
    const pool = await getConnection();
    let con = 1;
    while(con <= 60000){
        await pool.request()
        .query("INSERT INTO HUMAN_R.TELEPHONES_PERSON(bit_active,big_person_id_FK,big_telephon_id_FK) VALUES (1,"
        +con+"," 
        +con+")");
        console.log(con+"->60000")
        con++;   
    }
    
    pool.close;
    res.json("Succeses: T_person data") 
};