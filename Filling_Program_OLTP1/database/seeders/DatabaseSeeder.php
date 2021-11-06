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

         \App\Models\color::factory($colorQuantity)->create();
         \App\Models\manufacturer::factory($manufacturerQuantity)->create();
         \App\Models\brand::factory($brandQuantity)->create();
    }
}
