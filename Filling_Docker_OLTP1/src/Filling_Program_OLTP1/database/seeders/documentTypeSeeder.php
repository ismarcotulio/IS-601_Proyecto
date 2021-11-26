<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class documentTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $document_typeQuantity = 1;
        \App\Models\document_type::factory($document_typeQuantity)->create();
    }
}
