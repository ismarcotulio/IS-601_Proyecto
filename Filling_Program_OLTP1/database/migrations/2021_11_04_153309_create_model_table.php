<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateModelTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('MODEL', function (Blueprint $table) {
            $table->bigIncrements('big_id_PK');
            $table->string('var_name', 50)->unique();
            $table->text('tex_description')->default("");
            $table->bigInteger('big_brand_FK');
            $table->foreign('big_brand_FK')
                        ->references('big_id_PK')
                        ->on('BRAND')
                        ->onUpdate('cascade')
                        ->onDelete('cascade');
            ;
            $table->tinyInteger('tin_body_class_FK');
            $table->foreign('tin_body_class_FK')
                        ->references('tin_id_PK')
                        ->on('BODY_CLASS')
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
        Schema::dropIfExists('MODEL');
    }
}
