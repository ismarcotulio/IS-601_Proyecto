
import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getPerson = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM PERSON")
    //console.log(result)
    res.json(result.recordset)
};

export const newPerson = async (req, res) => {
    //const pool = await getConnection();
    //const result = await pool.request().query("SELECT * FROM HUMAN_R.PERSON")
    //console.log(result)
    //const {var_firstName,var_secondName,var_firstSurname,var_secondSurname,big_address_id_FK,cha_garder} = req.body
    //if (var_firstName == null || var_secondName == null || var_firstSurname == null || var_secondSurname == null || big_address_id_FK == null || cha_garder == null){
    //    return res.status(400).json({msg:'Bad request.'})
    //}
    console.log("Generating PERSON");
    const pool = await getConnection();
    let con = 1;
    while(con <= 37000){
        let gen = fakerPerson();
        await pool.request()
        .query("INSERT INTO PERSON(var_firstName,var_secondName,var_firstSurname, var_secondSurname,var_DNI,dat_dateOfBirth,cha_gender,big_address_id_FK) VALUES ('"
        +gen.var_firstName+"','"
        +gen.var_secondName+"','"
        +gen.var_firstSurname+"','"
        +gen.var_secondSurname+"', dbo.fnCustomPass(13,'N'), dbo.getRandomDate('1969-01-01', '1998-12-30'),'"
        +gen.cha_garder+"',"
        +gen.big_address_id_FK+")");
        con++;
    }
    
    pool.close;
    res()  
};





//FAKERS
function fakerPerson(){
    const n1 = faker.name.firstName()
    const n2 = faker.name.firstName()
    const n3 = faker.name.lastName()
    const n4 = faker.name.lastName()
    const addre = faker.datatype.number({
        'min': 10,
        'max': 70000
    });
    let sex = faker.datatype.number({
        'min': 1,
        'max': 2
    });

    if(sex==1){
        sex='M';
    }else{
        sex='F';
    }

        const arrjs = {
            "var_firstName": n1,
            "var_secondName": n2,
            "var_firstSurname": n3,
            "var_secondSurname": n4,
            "big_address_id_FK": addre,
            "cha_garder": sex
        };
        //console.log(arrjs);
        return arrjs;
    
}