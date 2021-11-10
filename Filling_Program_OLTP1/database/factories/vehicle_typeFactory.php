<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class vehicle_typeFactory extends Factory
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
                'Truck','Passenger Car','Multipurpose Passenger Vehicle'

                )),
                'tex_description' => $this->faker->sentence($nbWords = 9, $variableNbWords = true)
        ];
    }
}
