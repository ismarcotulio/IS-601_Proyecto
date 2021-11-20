<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class type_of_methodsFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'var_name' => $this->faker->unique()->randomElement($array = array ('Efectivo','Cheque','Tarjeta de Credito','Tarjeta de Debito','PayPal')),
        ];
    }
}
