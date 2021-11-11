<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDocumentType extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('DOCUMENT_TYPE', function (Blueprint $table) {
            $table->tinyIncrements('tin_id_PK');
            $table->integer('int_number');
            $table->string('var_code', 10);
            $table->string('var_name', 60);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('DOCUMENT_TYPE');
    }
}
