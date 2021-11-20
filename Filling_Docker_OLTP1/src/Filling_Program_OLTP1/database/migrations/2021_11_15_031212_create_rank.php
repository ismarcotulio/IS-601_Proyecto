<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRank extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('RANK', function (Blueprint $table) {
            $table->increments('int_id_PK');
            $table->integer('int_starting_range');
            $table->integer('int_final_range');
            $table->integer('int_current');
            $table->dateTime('dat_dueDate', $precision = 0);
            $table->time('tim_dueTime', $precision = 0);
            $table->boolean('bit_active');
            $table->tinyInteger('tin_document_type_FK');
            $table->foreign('tin_document_type_FK')
                        ->references('tin_id_PK')
                        ->on('DOCUMENT_TYPE')
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
        Schema::dropIfExists('rank');
    }
}
