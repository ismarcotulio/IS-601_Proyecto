<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIsv extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ISV', function (Blueprint $table) {
            $table->increments('int_id_PK');
            $table->unsignedDecimal('dec_amount', $precision = 10, $scale = 2);
            $table->tinyInteger('tin_type_of_isv_FK');
            $table->foreign('tin_type_of_isv_FK')
                        ->references('tin_id_PK')
                        ->on('TYPE_OF_ISV')
                        ->onUpdate('cascade')
                        ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ISV');
    }
}
