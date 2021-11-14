import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getCompany = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM HUMAN_R.CLIENT_COMPANY")
    //console.log(result)
    res.json(result.recordset)
};

export const newCompany = async (req, res) => {
    const pool = await getConnection();
    let con = 1;
    let big_client_id_FK = 1;
    while(con <= 10000){
        let gen = fakerCompany();
        await pool.request()
        .query("INSERT INTO HUMAN_R.CLIENT_COMPANY(var_name,big_id_address_FK,big_client_id_FK) VALUES ('"
        +gen.var_name+"',"
        +big_client_id_FK+","
        +gen.big_id_address_FK+")");
        console.log(gen)
        con++;
    }
    
    pool.close;
    res.json("Succeses: Companies data") 
};





//FAKERS
function fakerCompany(){
    const n1 = faker.company.companyName()
    const addre = faker.datatype.number({
        'min': 1,
        'max': 70000
    });

        const arrjs = {
            "var_name": n1,
            "big_id_address_FK": addre
        };
        //console.log(arrjs);
        return arrjs;
    
}