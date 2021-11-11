
import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getCities = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM HUMAN_R.CITIES")
    //console.log(result)
    res.json(result.recordset)
};

export const newCities = async (req, res) => {
    const pool = await getConnection();
    let con = 1;
    let big_departament_id_FK = 1
    while(big_departament_id_FK <= 1569){
        if(con==11){
            con=1; big_departament_id_FK++;
        }else{
            let gen = fakerCities();
            console.log(gen);
            await pool.request()
            .query("INSERT INTO HUMAN_R.CITIES(var_name,big_departament_id_FK) VALUES ('"
            +gen.var_name+"',"
            +big_departament_id_FK+")");
            con++;
        }
    }
    
    pool.close;
    res.json("Succeses: Cities data") 
};





//FAKERS
function fakerCities(){
    let Ncountry = faker.address.city();
    Ncountry=Ncountry.replace(/'/g,"''");
        const arrjs = {
            "var_name": Ncountry
        };
        
        //console.log(arrjs);
        return arrjs;
    
}