import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getTelephones = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM TELEPHONES")
    //console.log(result)
    res.json(result.recordset)
};

export const newTelephones = async (req, res) => {
    console.log("Generating TELEPHONES");
    const pool = await getConnection();
    let big_telephon_id_PK = 1;
    while(big_telephon_id_PK <= 500){
        try {
            let gen = fakerTelephones();
            await pool.request()
            .query("INSERT INTO TELEPHONES(big_telephon_id_PK,var_number,tin_telephonType_id_FK,int_country_id_FK) VALUES ("
            +big_telephon_id_PK+",'"
            +gen.var_number+"',"
            +gen.tin_telephonType_id_FK+","
            +gen.int_country_id_FK +")");
            big_telephon_id_PK++;
        } catch (error) {
            console.log(error)
        }
        
    }
    
    pool.close;
    res() 
};





//FAKERS
function fakerTelephones(){
    const n1 = faker.phone.phoneNumber()
    const contry = faker.datatype.number({
        'min': 1,
        'max': 26
    });
    const type = faker.datatype.number({
        'min': 1,
        'max': 2
    });

        const arrjs = {
            "var_number": n1,
            "tin_telephonType_id_FK": type,
            "int_country_id_FK": contry
        };
        //console.log(arrjs);
        return arrjs;
    
}