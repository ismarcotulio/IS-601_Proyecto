import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getArea = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM AREA")
    //console.log(result)
    res.json(result.recordset)
};

export const newArea = async (req, res) => {
    console.log("Generating AREA");
    const pool = await getConnection();
    let con = 1;
    while(con <= 15){
        try {
            let gen = fakerArea();
            await pool.request()
            .query("INSERT INTO AREA VALUES ("
            +con+",'" 
            +gen.var_name+"')");
            con++;
        } catch (error) {
            //console.log(error)
        }      
    }
    
    pool.close;
    res() 
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