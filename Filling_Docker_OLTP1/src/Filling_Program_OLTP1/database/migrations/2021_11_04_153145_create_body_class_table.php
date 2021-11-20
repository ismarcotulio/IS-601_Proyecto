<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBodyClassTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('BODY_CLASS', function (Blueprint $table) {
            $table->tinyIncrements('tin_id_PK');
            $table->string('var_name', 50)->unique();
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
        Schema::dropIfExists('BODY_CLASS');
    }
}
