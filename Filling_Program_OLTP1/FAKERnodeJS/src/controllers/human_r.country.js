
import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getConuntry = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM COUNTRY")
    //console.log(result)
    res.json(result.recordset)
};

export const newCountry = async (req, res) => {
    console.log("Generating Addresses");
    const pool = await getConnection();
    let con = 1;
    let int_country_id = 7
    while(con <= 150){
        let gen = fakerCountry();
        try {
            await pool.request()
            .query("INSERT INTO COUNTRY VALUES ("
            +int_country_id+",'"
            +gen.var_name+"','"
            +gen.var_code+"')");
            con++;
            int_country_id++;
        } catch (error) {
            //console.log(error)
        }
        
    }
    
    pool.close;
    res() 
};





//FAKERS
function fakerCountry(){
    const Ncountry = faker.address.country();
    const code = faker.datatype.number({
        'min':10,
        'max':999 
    });


        const arrjs = {
            "var_name": Ncountry,
            "var_code": code
        };
        //console.log(arrjs);
        return arrjs;
    
}