<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class fuel_typeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'var_name' => $this->faker->unique()->randomElement($array = array (
            'Gasolina','Kerosen','Diesel'

            )),
            'tex_description' => $this->faker->sentence($nbWords = 6, $variableNbWords = true)
                   ];
    }
}
