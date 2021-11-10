<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {

        $colorQuantity = 100;
        $manufacturerQuantity = 20;
        $brandQuantity = 174;
        $fuel_typeQuantity = 3;
        $type_movementQuantity = 2;
        $transaction_stateQuantity = 6;
        $bodyClassQuantity = 13;
        $modelQuantity = 2000;

         \App\Models\color::factory($colorQuantity)->create();
         \App\Models\manufacturer::factory($manufacturerQuantity)->create();
         \App\Models\brand::factory($brandQuantity)->create();
         \App\Models\fuel_type::factory($fuel_typeQuantity)->create();
         \App\Models\type_movement::factory($type_movementQuantity)->create();
         \App\Models\transaction_state::factory($transaction_stateQuantity)->create();
         \App\Models\body_class::factory($bodyClassQuantity)->create();
         \App\Models\vehicle_model::factory($modelQuantity)->create();
    }
}
