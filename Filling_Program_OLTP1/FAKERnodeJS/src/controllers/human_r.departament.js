
import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getDepartament = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM HUMAN_R.DEPARTAMENT")
    //console.log(result)
    res.json(result.recordset)
};

export const newDepartament = async (req, res) => {
    const pool = await getConnection();
    let con = 1;
    let int_country_id = 1
    while(int_country_id <= 156){
        if(con==11){
            con=1; int_country_id++;
        }else{
            let gen = fakerDepartament();
            await pool.request()
            .query("INSERT INTO HUMAN_R.DEPARTAMENT(var_name,int_country_id_FK) VALUES ('"
            +gen.var_name+"',"
            +int_country_id+")");
            console.log(gen);
            con++;
        }
    }
    
    pool.close;
    res.json("Succeses: departament data") 
};





//FAKERS
function fakerDepartament(){
    const Ncountry = faker.address.state();
    
        const arrjs = {
            "var_name": Ncountry
        };
        //console.log(arrjs);
        return arrjs;
    
}