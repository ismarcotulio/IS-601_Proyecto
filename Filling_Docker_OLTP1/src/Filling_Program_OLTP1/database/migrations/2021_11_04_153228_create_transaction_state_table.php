<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransactionStateTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('TRANSACTION_STATE', function (Blueprint $table) {
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
        Schema::dropIfExists('TRANSACTION_STATE');
    }
}
