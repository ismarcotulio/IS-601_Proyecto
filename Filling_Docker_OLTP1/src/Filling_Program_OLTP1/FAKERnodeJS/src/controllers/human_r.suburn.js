
import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getSuburn = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM SUBURN")
    //console.log(result)
    res.json(result.recordset)
};

export const newSuburn = async (req, res) => {
    const pool = await getConnection();
    let con = 1;
    let big_city_id_FK = 1
    let idsuburn = 10;
    while(big_city_id_FK <= 15699){
        if(con==3){
            con=1; big_city_id_FK++;
        }else{
            try {
                let gen = fakerSuburn();
                await pool.request()
                .query("INSERT INTO SUBURN VALUES ("
                +idsuburn+",'"
                +gen.var_name+"',"
                +big_city_id_FK+")");
                con++;
                idsuburn++;
            } catch (error) {
                //console.log(error)
            }
            
           
            
        }
    }
    
    pool.close;
    res()
};





//FAKERS
function fakerSuburn(){
    let Ncountry = faker.address.cityName();
    const suf = faker.address.citySuffix();
    Ncountry= Ncountry +" " + suf;
    Ncountry= Ncountry.replace(/'/g,"''");
        const arrjs = {
            "var_name": Ncountry
        };
        
        //console.log(arrjs);
        return arrjs;
    
}