import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getClientPerson = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM CLIENT_PERSON")
    //console.log(result)
    res.json(result.recordset)
};

export const newClientPerson = async (req, res) => {
    console.log("Generating CLIENT_PERSON");
    const pool = await getConnection();
    let con = 16;
    let big_client_id_FK = 11
    while(con <= 35){
        await pool.request()
        .query("INSERT INTO CLIENT_PERSON(big_person_id_FK,big_client_id_FK) VALUES ("
        +con+","
        +big_client_id_FK+")");
        con++;
        big_client_id_FK++;
    }
    
    pool.close;
    res() 
};