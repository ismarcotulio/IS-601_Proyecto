<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInvoice extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('INVOICE', function (Blueprint $table) {
            $table->bigIncrements('big_id_PK');
            $table->string('var_CAI', 45)->unique();
            $table->date('dat_deadlineDate');
            $table->time('tim_deadlineTime', $precision = 0);

            $table->tinyInteger('tin_branch_FK');
            $table->foreign('tin_branch_FK')
                        ->references('tin_id_branch_PK')
                        ->on('BRANCH_OFFICES')
                        ->onUpdate('cascade')
                        ->onDelete('cascade')
            ;

            $table->bigInteger('big_service_transaction_FK');
            $table->foreign('big_service_transaction_FK')
                        ->references('big_id_PK')
                        ->on('SERVICE_TRANSACTION')
                        ->onUpdate('cascade')
                        ->onDelete('cascade')
            ;

            $table->bigInteger('big_invoice_number_FK');
            $table->foreign('big_invoice_number_FK')
                        ->references('big_id_PK')
                        ->on('INVOICE_NUMBER')
                        ->onUpdate('cascade')
                        ->onDelete('cascade')
            ;

            $table->bigInteger('big_client_FK');
            $table->foreign('big_client_FK')
                        ->references('big_client_id_PK')
                        ->on('CLIENT')
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
        Schema::dropIfExists('INVOICE');
    }
}
