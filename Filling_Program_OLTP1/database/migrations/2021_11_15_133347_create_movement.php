<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMovement extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('VEHICLE_MOVEMENT', function (Blueprint $table) {
            $table->bigIncrements('big_id_PK');
            $table->date('dat_dueDate');
            $table->time('tim_dueTime', $precision = 0);

            $table->tinyInteger('tin_type_movement_FK');
            $table->foreign('tin_type_movement_FK')
                        ->references('tin_id_PK')
                        ->on('TYPE_MOVEMENT')
                        ->onUpdate('cascade')
                        ->onDelete('cascade')
            ;

            $table->tinyInteger('tin_branch_FK');
            $table->foreign('tin_branch_FK')
                        ->references('tin_id_branch_PK')
                        ->on('BRANCH_OFFICES')
                        ->onUpdate('cascade')
                        ->onDelete('cascade')
            ;

            $table->bigInteger('big_vehicle_FK');
            $table->foreign('big_vehicle_FK')
                        ->references('big_id_PK')
                        ->on('VEHICLE')
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
        Schema::dropIfExists('VEHICLE_MOVEMENT');
    }
}
