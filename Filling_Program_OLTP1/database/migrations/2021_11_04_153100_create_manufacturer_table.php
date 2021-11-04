<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateManufacturerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('MANUFACTURER', function (Blueprint $table) {
            $table->increments('int_id_PK');
            $table->string('var_name', 50);
            $table->string('var_commonName', 50)->nullable()->default("");
            $table->string('var_postalCode', 50)->nullable()->default("");
            $table->tinyInteger('tin_location_FK')->default(1);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('MANUFACTURER');
    }
}
