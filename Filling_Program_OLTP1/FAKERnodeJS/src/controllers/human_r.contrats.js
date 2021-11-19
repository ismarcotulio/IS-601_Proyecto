
import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getContracts = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM CONTRACTS")
    //console.log(result)
    res.json(result.recordset)
};

export const newContracts = async (req, res) => {
    console.log("Generating CONTRACTS");
    const pool = await getConnection();
    let con = 1;
    while(con <= 15){
        let gen = fakerContract();
        await pool.request()
        .query("INSERT INTO CONTRACTS(bit_active,tin_position_id_FK,mon_salary) VALUES (1,"
        +gen.tin_position_id_FK+","
        +gen.mon_salary+")");
        con++;
    }
    
    pool.close;
    res() 
};





//FAKERS
function fakerContract(){
    let position = faker.datatype.number({
        'min': 1,
        'max': 70
    });
    const salary = faker.datatype.number({
        'min': 8500,
        'max': 19000
    });

        const arrjs = {
            "tin_position_id_FK": position,
            "mon_salary": salary
        };
        //console.log(arrjs);
        return arrjs;
    
}