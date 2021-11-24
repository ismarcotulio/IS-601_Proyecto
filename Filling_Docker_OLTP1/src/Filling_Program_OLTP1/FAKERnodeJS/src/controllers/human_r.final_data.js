import {getConnection} from '../database/connection'

export const dataFinalFill = async (req, res) => {
    console.log("Generating Final Data");
    const pool = await getConnection();
    //Procedures

    await pool.request()
    .query("EXEC DATEREGIS");
    pool.close;
    await pool.request()
    .query("EXEC CreateSalaryEmployees");
    pool.close;
    await pool.request()
    .query("EXEC ModifyAddress");
    pool.close;
    await pool.request()
    .query("EXEC MOVEMENT_PAY");
    pool.close;
    await pool.request()
    .query("EXEC SalaryCalculate");

    pool.close;
    console.log("Finished")
    res()
};
