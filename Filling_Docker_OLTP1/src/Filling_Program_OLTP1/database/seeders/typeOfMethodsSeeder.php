<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class typeOfMethodsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $type_of_methodsQuantity = 5;
        \App\Models\type_of_methods::factory($type_of_methodsQuantity)->create();
    }
}
