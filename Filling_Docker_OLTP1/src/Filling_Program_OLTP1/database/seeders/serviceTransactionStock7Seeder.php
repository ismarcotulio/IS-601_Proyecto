<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class serviceTransactionStock7Seeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $service_transactionQuantity = 10000; 
         \App\Models\service_transaction::factory($service_transactionQuantity)->create();
    }
}
