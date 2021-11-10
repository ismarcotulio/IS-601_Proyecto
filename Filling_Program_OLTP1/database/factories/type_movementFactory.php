<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class type_movementFactory extends Factory
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
                'Transfer','Arrival'

                )),
                'tex_description' => $this->faker->text($maxNbChars = 200)
        ];
    }
}
