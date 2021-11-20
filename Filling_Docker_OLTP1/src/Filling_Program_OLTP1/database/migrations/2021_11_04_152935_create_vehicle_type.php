<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVehicleType extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('VEHICLE_TYPE', function (Blueprint $table) {
            $table->tinyIncrements('tin_id_PK');
            $table->string('var_name', 100);
            $table->text('tex_description')->default("");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('VEHICLE_TYPE');
    }
}
