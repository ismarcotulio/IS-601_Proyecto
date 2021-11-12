import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getArea = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM HUMAN_R.AREA")
    //console.log(result)
    res.json(result.recordset)
};

export const newArea = async (req, res) => {
    const pool = await getConnection();
    let con = 1;
    while(con <= 25){
        try {
            let gen = fakerArea();
            console.log(gen);
            await pool.request()
            .query("INSERT INTO HUMAN_R.AREA VALUES ("
            +con+",'" 
            +gen.var_name+"')");
            con++;
        } catch (error) {
            console.log(error)
        }      
    }
    
    pool.close;
    res.json("Succeses: Area data") 
};





//FAKERS
function fakerArea(){
    let position = faker.name.jobArea()//jobType();
        const arrjs = {
            "var_name": position
        };
        
        //console.log(arrjs);
        return arrjs;
    
}