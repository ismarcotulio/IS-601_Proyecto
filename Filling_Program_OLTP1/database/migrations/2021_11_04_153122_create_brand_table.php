<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBrandTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('BRAND', function (Blueprint $table) {
            $table->bigIncrements('big_id_PK');
            $table->string('var_name', 50)->unique();
            $table->text('tex_description')->default("");
            $table->integer('int_manufacturer_FK');
            $table->foreign('int_manufacturer_FK')
                        ->references('int_id_PK')
                        ->on('MANUFACTURER')
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
        Schema::dropIfExists('BRAND');
    }
}
