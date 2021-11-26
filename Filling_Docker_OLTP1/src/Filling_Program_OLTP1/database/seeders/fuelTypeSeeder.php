<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class fuelTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $fuel_typeQuantity = 3;
        \App\Models\fuel_type::factory($fuel_typeQuantity)->create();
    }
}
