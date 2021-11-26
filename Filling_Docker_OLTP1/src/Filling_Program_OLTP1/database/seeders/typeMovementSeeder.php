<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class typeMovementSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $type_movementQuantity = 5;
        \App\Models\type_movement::factory($type_movementQuantity)->create();
    }
}
