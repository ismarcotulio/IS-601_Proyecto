<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class serviceTransactionStock2Seeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $service_transactionQuantity = 5000; 
         \App\Models\service_transaction::factory($service_transactionQuantity)->create();
    }
}
