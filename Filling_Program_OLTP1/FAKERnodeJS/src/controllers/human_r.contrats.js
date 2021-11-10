
import {getConnection, sql} from '../database/connection'
const faker = require('faker/locale/es')
//import {generate} from '../Fakers/fakerPerson'

export const getContracts = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM HUMAN_R.CONTRACTS")
    //console.log(result)
    res.json(result.recordset)
};

export const newContracts = async (req, res) => {
    const pool = await getConnection();
    let con = 1;
    while(con <= 2){
        let gen = fakerContract();
        await pool.request()
        .query("INSERT INTO HUMAN_R.CONTRACTS(dat_hiringDate,bit_active,tin_position_id_FK,mon_salary) VALUES (dbo.getRandomDate('2009-01-01', '2019-12-30'),1,"
        +gen.tin_position_id_FK+","
        +gen.mon_salary+")");
        console.log(gen)
        con++;
    }
    
    pool.close;
    res.json("Succeses") 
};





//FAKERS
function fakerContract(){
    let position = faker.datatype.number({
        'min': 1,
        'max': 14
    });
    const salary = faker.datatype.number({
        'min': 8500,
        'max': 19000
    });

    if(position==5){
        position=3;
    }

        const arrjs = {
            "tin_position_id_FK": position,
            "mon_salary": salary
        };
        //console.log(arrjs);
        return arrjs;
    
}