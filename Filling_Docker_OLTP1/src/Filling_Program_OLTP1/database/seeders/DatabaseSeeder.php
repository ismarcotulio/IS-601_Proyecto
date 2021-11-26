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

        $this->call([
            colorSeeder::class,
            manufacturerSeeder::class,
            brandSeeder::class,
            fuelTypeSeeder::class,
            typeMovementSeeder::class,
            transactionStateSeeder::class,
            bodyClassSeeder::class,
            modelSeeder::class,
            vehicleTypeSeeder::class,
            vehicleStock1Seeder::class,
            vehicleStock2Seeder::class,

            documentTypeSeeder::class,
            printingSeeder::class,
            emissionPointSeeder::class,
            typeOfMethodsSeeder::class,
            typeOfISVSeeder::class,
            serviceTransactionStock1Seeder::class,
            serviceTransactionStock2Seeder::class,
        ]);

    }
}
