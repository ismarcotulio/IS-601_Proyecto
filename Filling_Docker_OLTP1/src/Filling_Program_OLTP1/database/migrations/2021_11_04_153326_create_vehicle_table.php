<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVehicleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('VEHICLE', function (Blueprint $table) {
            $table->bigIncrements('big_id_PK');
            $table->unsignedDecimal('dec_base_price', $precision = 10, $scale = 2)
                        ->default(0)
            ;
            $table->string('var_vin', 45)->unique();
            $table->string('var_engine', 100)->default("");
            $table->string('var_brake_system', 50)->default("");
            $table->tinyInteger('tin_number_cylinders')->default(4);
            $table->unsignedDecimal('dec_displacement_cc', $precision = 10, $scale = 2)
                        ->default(0)
            ;
            $table->string('var_gvwr', 100)->default("");
            $table->boolean('bit_use_state');
            $table->text('tex_description')->default("");
            $table->integer('int_year')->default(2021);
            $table->tinyInteger('tin_doors')->default(4);
            $table->tinyInteger('tin_color_FK');
            $table->foreign('tin_color_FK')
                        ->references('tin_id_PK')
                        ->on('COLOR')
                        ->onUpdate('cascade')
                        ->onDelete('cascade')
            ;
            $table->bigInteger('big_model_FK');
            $table->foreign('big_model_FK')
                        ->references('big_id_PK')
                        ->on('MODEL')
                        ->onUpdate('cascade')
                        ->onDelete('cascade');
            ;
            $table->tinyInteger('tin_fuel_type_FK');
            $table->foreign('tin_fuel_type_FK')
                        ->references('tin_id_PK')
                        ->on('FUEL_TYPE')
                        ->onUpdate('cascade')
                        ->onDelete('cascade')
            ;
            $table->tinyInteger('tin_vehicle_type_FK');
            $table->foreign('tin_vehicle_type_FK')
                        ->references('tin_id_PK')
                        ->on('VEHICLE_TYPE')
                        ->onUpdate('cascade')
                        ->onDelete('cascade')
            ;
            $table->tinyInteger('tin_transaction_state_FK');
            $table->foreign('tin_transaction_state_FK')
                        ->references('tin_id_PK')
                        ->on('TRANSACTION_STATE')
                        ->onUpdate('cascade')
                        ->onDelete('cascade')
            ;
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('VEHICLE');
    }
}
