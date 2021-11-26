<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class bodyClassSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $bodyClassQuantity = 13;
        \App\Models\body_class::factory($bodyClassQuantity)->create();
    }
}
