<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class vehicleStock4Seeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $vehicleQuantity = 70000;
        \App\Models\vehicle::factory($vehicleQuantity)->create();
    }
}
