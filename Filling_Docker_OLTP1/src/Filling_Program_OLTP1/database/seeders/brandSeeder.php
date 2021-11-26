<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class brandSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $brandQuantity = 174;
        \App\Models\brand::factory($brandQuantity)->create();
    }
}
