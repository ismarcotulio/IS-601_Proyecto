<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class manufacturerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $manufacturerQuantity = 20;
        \App\Models\manufacturer::factory($manufacturerQuantity)->create();
    }
}
