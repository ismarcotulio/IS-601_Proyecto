<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class vehicleTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $vehicle_typeQuantity = 3;
        \App\Models\vehicle_type::factory($vehicle_typeQuantity)->create();
    }
}
