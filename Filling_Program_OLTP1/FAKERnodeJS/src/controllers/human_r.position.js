import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getPosition = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM HUMAN_R.POSITION")
    //console.log(result)
    res.json(result.recordset)
};

export const newPosition = async (req, res) => {
    const pool = await getConnection();
    let con = 1;
    while(con <= 70){
        try {
            let gen = fakerPosition();
            console.log(gen);
            await pool.request()
            .query("INSERT INTO HUMAN_R.POSITION(tin_position_id_PK,var_name) VALUES ("
            +con+",'" 
            +gen.var_name+"')");
            con++;
        } catch (error) {
            console.log(error)
        }      
    }
    
    pool.close;
    res.json("Succeses: Position data") 
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