<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class colorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $colorQuantity = 100;
        \App\Models\color::factory($colorQuantity)->create();
    }
}
