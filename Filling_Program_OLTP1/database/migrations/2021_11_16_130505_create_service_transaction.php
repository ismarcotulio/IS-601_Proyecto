<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateServiceTransaction extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('SERVICE_TRANSACTION', function (Blueprint $table) {
            $table->bigIncrements('big_id_PK');
            $table->date('dat_date_of_issue');
            $table->time('tim_time_of_issue', $precision = 0);
            $table->decimal('mon_subtotal', $precision = 10, $scale = 4);
            $table->tinyInteger('tin_discount');
            $table->decimal('mon_reduction', $precision = 10, $scale = 4);
            $table->decimal('mon_total_to_pay', $precision = 10, $scale = 4);

            $table->integer('int_isv_FK');
            $table->foreign('int_isv_FK')
                        ->references('int_id_PK')
                        ->on('ISV')
                        ->onUpdate('cascade')
                        ->onDelete('cascade')
            ;

            $table->integer('int_employees_FK');
            $table->foreign('int_employees_FK')
                        ->references('int_employee_id_PK')
                        ->on('EMPLOYEES')
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
        Schema::dropIfExists('SERVICE_TRANSACTION');
    }
}
