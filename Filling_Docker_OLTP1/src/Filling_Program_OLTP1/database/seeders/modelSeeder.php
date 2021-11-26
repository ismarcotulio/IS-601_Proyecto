<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class modelSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $modelQuantity = 200;
        \App\Models\vehicle_model::factory($modelQuantity)->create();
    }
}
