<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class transactionStateSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $transaction_stateQuantity = 3;
        \App\Models\transaction_state::factory($transaction_stateQuantity)->create();
    }
}
