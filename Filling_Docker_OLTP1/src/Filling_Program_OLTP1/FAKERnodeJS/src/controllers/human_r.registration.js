
import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getRegistration= async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM REGISTRATION_HIRES")
    //console.log(result)
    res.json(result.recordset)
};

export const newRegistration = async (req, res) => {
    console.log("Generating REGISTRATION_HIRES");
    const pool = await getConnection();
    let con = 1;
    
    while(con <= 15){
        let gen = fakerRegistration();
        try {
            await pool.request()
            .query("INSERT INTO REGISTRATION_HIRES(int_contract_id_FK, dat_hiringDate, int_employee_id_FK, tin_typeRegistration_id_FK) VALUES ("
            +con+",dbo.getRandomDate('2000-01-01', '2021-12-30'),"
            +con+",1)");
            if(gen.aleat>1){
                await pool.request()
                .query("INSERT INTO REGISTRATION_HIRES(int_contract_id_FK, dat_hiringDate, int_employee_id_FK, tin_typeRegistration_id_FK) VALUES ("
                +con+",dbo.getRandomDate('2000-01-01', '2021-12-30'),"
                +con+","
                +gen.aleat+")");
            }
            con++;
            
        } catch (error) {
            console.log(error)
            //break;
        }
        
    }
        
    pool.close;
    res() 
};





//FAKERS
function fakerRegistration(){
    const date = faker.date.between('2000-01-01','2021-12-31');
    const area = faker.datatype.number({
        'min': 1,
        'max': 3
    });

        const arrjs = {
            "dat_hiringDate": date.toString().substr(0,9),
            "aleat": area
        };
        //console.log(arrjs);
        return arrjs;
    
}