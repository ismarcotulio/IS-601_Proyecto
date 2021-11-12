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
        //LOGISTIC
        $colorQuantity = 100;
        $manufacturerQuantity = 20;
        $brandQuantity = 174;
        $fuel_typeQuantity = 3;
        $type_movementQuantity = 2;
        $transaction_stateQuantity = 6;
        $bodyClassQuantity = 13;
        $modelQuantity = 2000;
        $vehicle_typeQuantity = 3;
        $vehicleQuantity = 5000;

        //FINANTIAL
        $document_typeQuantity = 10;
        $printingQuantity = 20;
        $emission_pointQuantity = 200;


         \App\Models\color::factory($colorQuantity)->create();
         \App\Models\manufacturer::factory($manufacturerQuantity)->create();
         \App\Models\brand::factory($brandQuantity)->create();
         \App\Models\fuel_type::factory($fuel_typeQuantity)->create();
         \App\Models\type_movement::factory($type_movementQuantity)->create();
         \App\Models\transaction_state::factory($transaction_stateQuantity)->create();
         \App\Models\body_class::factory($bodyClassQuantity)->create();
         \App\Models\vehicle_model::factory($modelQuantity)->create();
         \App\Models\vehicle_type::factory($vehicle_typeQuantity)->create();
         \App\Models\vehicle::factory($vehicleQuantity)->create();

         \App\Models\document_type::factory($document_typeQuantity)->create();
         \App\Models\printing::factory($printingQuantity)->create();
         \App\Models\emission_point::factory($emission_pointQuantity)->create();

    }
}
