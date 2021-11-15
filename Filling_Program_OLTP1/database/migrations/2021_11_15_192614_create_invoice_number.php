<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInvoiceNumber extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('INVOICE_NUMBER', function (Blueprint $table) {
            $table->bigIncrements('big_id_PK');
            $table->integer('correlative_number');
            $table->integer('int_emission_point_FK');
            $table->foreign('int_emission_point_FK')
                        ->references('int_id_PK')
                        ->on('EMISSION_POINT')
                        ->onUpdate('cascade')
                        ->onDelete('cascade');
        ;
            $table->integer('int_printing_FK');
            $table->foreign('int_printing_FK')
                        ->references('int_id_PK')
                        ->on('PRINTING')
                        ->onUpdate('cascade')
                        ->onDelete('cascade');
        ;
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
        Schema::dropIfExists('INVOICE_NUMBER');
    }
}
