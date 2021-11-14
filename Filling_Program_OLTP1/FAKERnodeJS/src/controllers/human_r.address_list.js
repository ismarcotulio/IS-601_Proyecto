
import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getAdress = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM HUMAN_R.LIST_ADDRESS")
    //console.log(result)
    res.json(result.recordset)
};

export const newAdress = async (req, res) => {
    const pool = await getConnection();
    const conn=1
    let con = 1;
    while(con <= 69993){
        let gen = fakerAdress();
        await pool.request()
        .query("INSERT INTO HUMAN_R.LIST_ADDRESS(tex_reference,int_country_id_FK,big_departament_id_FK,big_city_id_FK,big_suburn_id_FK) VALUES ('"
        +gen.tex_reference+"',"
        +conn+","
        +conn+","
        +conn+","
        +gen.big_suburn_id_FK+")");
        console.log(gen)
        con++;
    }
    
    pool.close;
    res.json("Succeses: Adress Data") 
};





//FAKERS
function fakerAdress(){
    let tex_reference = faker.address.streetAddress()
    const refe=  faker.address.streetPrefix();
    tex_reference = refe+ " " + tex_reference ;
    const big_suburn_id_FK = faker.datatype.number({
        'min': 1,
        'max': 31407
    });

        const arrjs = {
            "tex_reference": tex_reference,
            "big_suburn_id_FK": big_suburn_id_FK
        };
        //console.log(arrjs);
        return arrjs;
    
}