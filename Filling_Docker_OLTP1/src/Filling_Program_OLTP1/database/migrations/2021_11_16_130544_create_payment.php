<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePayment extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('PAYMENT', function (Blueprint $table) {
            $table->bigIncrements('big_id_PK');
            $table->decimal('mon_amount', $precision = 10, $scale = 4);

            $table->tinyInteger('tin_type_of_method_FK');
            $table->foreign('tin_type_of_method_FK')
                        ->references('tin_id_PK')
                        ->on('TYPE_OF_METHODS')
                        ->onUpdate('cascade')
                        ->onDelete('cascade')
            ;

            $table->bigInteger('big_invoice_FK');
            $table->foreign('big_invoice_FK')
                        ->references('big_id_PK')
                        ->on('INVOICE')
                        ->onUpdate('cascade')
                        ->onDelete('cascade');
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
        Schema::dropIfExists('PAYMENT');
    }
}
