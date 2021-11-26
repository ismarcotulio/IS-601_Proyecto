<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class emissionPointSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $emission_pointQuantity = 200;
        \App\Models\emission_point::factory($emission_pointQuantity)->create();
    }
}
