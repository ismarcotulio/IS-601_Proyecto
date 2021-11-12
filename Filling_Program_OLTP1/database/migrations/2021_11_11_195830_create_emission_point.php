<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmissionPoint extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('EMISSION_POINT', function (Blueprint $table) {
            $table->increments('int_id_PK');
            $table->enum('var_modality', ['Caja Registradora', 'SFC']);
            $table->integer('int_number');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('EMISSION_POINT');
    }
}
