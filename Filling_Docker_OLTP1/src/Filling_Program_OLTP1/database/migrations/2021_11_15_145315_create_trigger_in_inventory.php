<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

class CreateTriggerInInventory extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
CREATE TRIGGER tg_inInventory
	ON CarDealership_OLTP1.dbo.VEHICLE AFTER INSERT AS
		BEGIN

		DECLARE @year INT;
		DECLARE @dueDate DATE;
		DECLARE @dueTime TIME;
		DECLARE @type_movement TINYINT;
		DECLARE @branch TINYINT;
		DECLARE @vehicleId BIGINT;


		SELECT @year = INSERTED.int_year
		FROM INSERTED

		SET @dueDate = CONCAT(@year,'-01-01');
		SET @dueTime = (SELECT CONVERT (time, SYSDATETIME()));
		SET @type_movement = 1;
		SET @branch = (SELECT FLOOR(RAND()*((SELECT COUNT('tin_id_branch_PK') FROM [CarDealership_OLTP1].[dbo].[BRANCH_OFFICES])-1+1))+1);

		SELECT @vehicleId = INSERTED.big_id_PK
		FROM INSERTED



			INSERT INTO [CarDealership_OLTP1].[dbo].[VEHICLE_MOVEMENT] (dat_dueDate, tim_dueTime, tin_type_movement_FK, tin_branch_FK, big_vehicle_FK) VALUES
				(@dueDate, @dueTime, @type_movement, @branch, @vehicleId)
			;

			SET @dueDate = CONCAT(@year,'-01-02');
			SET @type_movement = 2;

			INSERT INTO [CarDealership_OLTP1].[dbo].[VEHICLE_MOVEMENT] (dat_dueDate, tim_dueTime, tin_type_movement_FK, tin_branch_FK, big_vehicle_FK) VALUES
				(@dueDate, @dueTime, @type_movement, @branch, @vehicleId)
			;
		END
        ");
    }

    public function down()
    {
        DB::unprepared('DROP TRIGGER tg_inInventory;');
    }
}
