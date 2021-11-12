<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class type_of_isvFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'var_name' => $this->faker->unique()->randomElement($array = array ('Impuesto Sobre Venta 15%','Impuesto Sobre Venta 18%',)),
            'tin_percent' => $this->faker->unique()->randomElement($array = array (15,18)),
        ];
    }
}
