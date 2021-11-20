<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;

class CreateTriggerSold extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
CREATE TRIGGER tg_sold
	ON CarDealership_OLTP1.dbo.SERVICE_DETAIL AFTER INSERT AS
		BEGIN

		DECLARE @transactionId BIGINT;
        DECLARE @vehicleId BIGINT;
		DECLARE @dueDate DATE;
		DECLARE @dueTime TIME;
		DECLARE @type_movement TINYINT;
		DECLARE @branch TINYINT;


		SELECT @transactionId = INSERTED.big_service_transaction_FK
		FROM INSERTED;

        SELECT @vehicleId = INSERTED.big_vehicle_FK
		FROM INSERTED;

		SET @dueDate = (SELECT [dat_date_of_issue] FROM [CarDealership_OLTP1].[dbo].[SERVICE_TRANSACTION] WHERE big_id_PK = @transactionId);
		SET @dueTime = (SELECT [tim_time_of_issue] FROM [CarDealership_OLTP1].[dbo].[SERVICE_TRANSACTION] WHERE big_id_PK = @transactionId);
		SET @type_movement = 2;
		SET @branch = (
            SELECT TOP 1 [tin_branch_FK] FROM [CarDealership_OLTP1].[dbo].[VEHICLE_MOVEMENT] WHERE big_vehicle_FK = @vehicleId ORDER BY [big_id_PK] DESC
        );


			INSERT INTO [CarDealership_OLTP1].[dbo].[VEHICLE_MOVEMENT] (dat_dueDate, tim_dueTime, tin_type_movement_FK, tin_branch_FK, big_vehicle_FK) VALUES
				(@dueDate, @dueTime, @type_movement, @branch, @vehicleId)
			;

            UPDATE [CarDealership_OLTP1].[dbo].[VEHICLE]
            SET tin_transaction_state_FK = 3
            WHERE big_id_PK = @vehicleId;
		END
        ");
    }

    public function down()
    {
        DB::unprepared('DROP TRIGGER tg_sold;');
    }
}
