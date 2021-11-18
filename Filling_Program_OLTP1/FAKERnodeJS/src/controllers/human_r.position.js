import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getPosition = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM POSITION")
    //console.log(result)
    res.json(result.recordset)
};

export const newPosition = async (req, res) => {
    console.log("Generating POSITION");
    const pool = await getConnection();
    let con = 1;
    while(con <= 15){
        try {
            let gen = fakerPosition();
            await pool.request()
            .query("INSERT INTO POSITION(tin_position_id_PK,var_name) VALUES ("
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
function fakerPosition(){
    let position = faker.name.jobTitle()//jobType();
        const arrjs = {
            "var_name": position
        };
        
        //console.log(arrjs);
        return arrjs;
    
}