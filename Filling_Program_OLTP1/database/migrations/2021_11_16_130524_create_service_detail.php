<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateServiceDetail extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('SERVICE_DETAIL', function (Blueprint $table) {
            $table->bigIncrements('big_id_PK');
            $table->decimal('mon_price', $precision = 10, $scale = 4);
            $table->decimal('mon_exempt_value', $precision = 10, $scale = 4);
            $table->decimal('mon_total', $precision = 10, $scale = 4);

            $table->bigInteger('big_vehicle_FK');
            $table->foreign('big_vehicle_FK')
                        ->references('big_id_PK')
                        ->on('VEHICLE')
                        ->onUpdate('cascade')
                        ->onDelete('cascade');
            ;

            $table->bigInteger('big_service_transaction_FK');
            $table->foreign('big_service_transaction_FK')
                        ->references('big_id_PK')
                        ->on('SERVICE_TRANSACTION')
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
        Schema::dropIfExists('SERVICE_DETAIL');
    }
}
