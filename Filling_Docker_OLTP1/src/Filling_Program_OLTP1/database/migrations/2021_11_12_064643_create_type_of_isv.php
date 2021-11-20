<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTypeOfIsv extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('TYPE_OF_ISV', function (Blueprint $table) {
            $table->tinyIncrements('tin_id_PK');
            $table->string('var_name', 40);
            $table->tinyInteger('tin_percent');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('TYPE_OF_ISV');
    }
}
