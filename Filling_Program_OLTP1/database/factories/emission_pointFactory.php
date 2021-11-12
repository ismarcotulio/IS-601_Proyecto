<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class emission_pointFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'int_number' => $this->faker->unique()->numberBetween($min = 0001, $max = 9999),
            'var_modality' => $this->faker->randomElement($array = array ('Caja Registradora','SFC')),
        ];
    }
}
