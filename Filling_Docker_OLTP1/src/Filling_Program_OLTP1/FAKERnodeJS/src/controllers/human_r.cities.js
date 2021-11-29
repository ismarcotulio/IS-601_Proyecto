
import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getCities = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM CITIES")
    //console.log(result)
    res.json(result.recordset)
};

export const newCities = async (req, res) => {
    const pool = await getConnection();
    let con = 1;
    let big_departament_id_FK = 1
    while(big_departament_id_FK <= 35){
        if(con==2){
            con=1; big_departament_id_FK++;
        }else{
            let gen = fakerCities();
            await pool.request()
            .query("INSERT INTO CITIES(var_name,big_departament_id_FK) VALUES ('"
            +gen.var_name+"',"
            +big_departament_id_FK+")");
            con++;
        }
    }
    
    pool.close;
    res()  
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