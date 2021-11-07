import {getConnection} from '../database/connection'

export const getPerson = async (req, res) => {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM HUMAN_R.PERSON")
    //console.log(result)
    res.json(result.recordset)
};

export const newPerson = async (req, res) => {
    //const pool = await getConnection();
    //const result = await pool.request().query("SELECT * FROM HUMAN_R.PERSON")
    //console.log(result)
    const {var_firstName,var_secondName,var_firstSurname,var_secondSurname,var_DNI,dat_dateOfBirth,big_address_id_FK,var_RTN_Personal,cha_garder} = req.body
    console.log(var_firstName,var_secondName,var_firstSurname,var_secondSurname,var_DNI,dat_dateOfBirth,big_address_id_FK,var_RTN_Personal,cha_garder)
    res.json('newPerson')
};