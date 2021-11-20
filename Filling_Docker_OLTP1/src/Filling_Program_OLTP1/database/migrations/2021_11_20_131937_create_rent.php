<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRent extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('RENT', function (Blueprint $table) {
            $table->bigIncrements('big_id_PK');
            $table->date('dat_limit_rent');
            $table->time('tim_limit_rent', $precision = 0);

            $table->bigInteger('big_service_transaction_FK');
            $table->foreign('big_service_transaction_FK')
                        ->references('big_id_PK')
                        ->on('SERVICE_TRANSACTION')
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
        Schema::dropIfExists('RENT');
    }
}
