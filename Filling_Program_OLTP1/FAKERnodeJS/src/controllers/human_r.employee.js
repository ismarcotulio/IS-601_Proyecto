
import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getEmployee= async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM EMPLOYEES")
    //console.log(result)
    res.json(result.recordset)
};

export const newEmployee = async (req, res) => {
    console.log("Generating EMPLOYEES");
    const pool = await getConnection();
    let con = 1;
    let person = 1;
    while(con <= 15){
        let gen = fakerEmployee();
        try {
            await pool.request()
            .query("INSERT INTO EMPLOYEES(var_code,tin_branch_id_FK,tin_area_id_FK,big_person_id_FK) VALUES (dbo.fnCustomPass(10,'CN'),"
            +gen.tin_branch_id_FK+","
            +gen.tin_area_id_FK+","
            +person+")");
            con++;
            person++;
        } catch (error) {
            //console.log(error)
            //break;
        }
        
    }
        
    pool.close;
    res() 
};





//FAKERS
function fakerEmployee(){
    const sucursal = faker.datatype.number({
        'min': 1,
        'max': 9
    });
    const area = faker.datatype.number({
        'min': 1,
        'max': 15
    });

        const arrjs = {
            "tin_branch_id_FK": sucursal,
            "tin_area_id_FK": area
        };
        //console.log(arrjs);
        return arrjs;
    
}