<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class typeOfISVSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $type_of_isvQuantity = 2;
        $isvQuantity = 200;
        $rankQuantity = 4;

        \App\Models\type_of_isv::factory($type_of_isvQuantity)->create();
        \App\Models\isv::factory($isvQuantity)->create();
         \App\Models\rank::factory($rankQuantity)->create();
    }
}
