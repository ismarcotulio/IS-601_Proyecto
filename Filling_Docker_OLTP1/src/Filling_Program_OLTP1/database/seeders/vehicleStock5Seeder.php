<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class vehicleStock5Seeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $vehicleQuantity = 50000;
        \App\Models\vehicle::factory($vehicleQuantity)->create();
    }
}
