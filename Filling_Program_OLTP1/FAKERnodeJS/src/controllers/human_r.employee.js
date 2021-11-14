
import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getEmployee= async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM HUMAN_R.EMPLOYEES")
    //console.log(result)
    res.json(result.recordset)
};

export const newEmployee = async (req, res) => {
    const pool = await getConnection();
    let con = 1;
    let person = 1;
    let contra = 1;
    while(con <= 5000){
        let gen = fakerEmployee();
        try {
            console.log(gen)
            await pool.request()
            .query("INSERT INTO HUMAN_R.EMPLOYEES(var_code,tin_branch_id_FK,tin_area_id_FK,int_contract_id_FK,big_person_id_FK) VALUES (dbo.fnCustomPass(10,'CN'),"
            +gen.tin_branch_id_FK+","
            +gen.tin_area_id_FK+","
            +contra+","
            +person+")");
            con++;
            person = person + 10;
            contra++;
        } catch (error) {
            console.log(error)
            break;
        }
        
    }
        
    pool.close;
    res.json("Succeses: Employees data") 
};





//FAKERS
function fakerEmployee(){
    const sucursal = faker.datatype.number({
        'min': 1,
        'max': 9
    });
    const area = faker.datatype.number({
        'min': 1,
        'max': 25
    });

        const arrjs = {
            "tin_branch_id_FK": sucursal,
            "tin_area_id_FK": area
        };
        //console.log(arrjs);
        return arrjs;
    
}