<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class document_typeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'int_number' => $this->faker->unique()->numberBetween($min = 1, $max = 12),
            'var_code' => $this->faker->bothify('??###'),
            'var_name' => $this->faker->unique()->randomElement($array = array ('Factura')),
        ];
    }
}
