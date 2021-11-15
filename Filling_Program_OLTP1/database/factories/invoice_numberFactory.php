<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class invoice_numberFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $emission_point = \App\Models\emission_point::all()->random()->int_id_PK;
        $printing = \App\Models\printing::all()->random()->int_id_PK;
        $document_type = \App\Models\document_type::all()->random()->big_id_PK;

        $faker = (new \Faker\Factory())::create();
        $faker->addProvider(new \Faker\Provider\Fakecar($faker));

        return [
            'int_correlative_number' => $this->faker->numberBetween($min = 101000001, $max = 101050001),
            'int_emission_point_FK' => $emission_point,
            'int_printing_FK' => $printing,
            'tin_document_type_FK' => $document_type,
        ];
    }
}
