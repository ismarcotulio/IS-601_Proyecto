import {getConnection} from '../database/connection'

export const dataFinalFill = async (req, res) => {
    console.log("Generating Final Data");
    const pool = await getConnection();
    //Procedures

    await pool.request()
    .query("EXEC CreateSalaryEmployees");
    await pool.request()
    .query("EXEC ModifyAddress");
    await pool.request()
    .query("EXEC MOVEMENT_PAY");
    await pool.request()
    .query("EXEC SalaryCalculate");

    pool.close;
    console.log("Finished")
    res()
};
