<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class printingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $printingQuantity = 20;
        \App\Models\printing::factory($printingQuantity)->create();
    }
}
