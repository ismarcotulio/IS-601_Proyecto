<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class printingFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'var_code' => $this->faker->unique()->bothify('##############'),
            'var_authorization_number' => $this->faker->unique()->bothify('####-##-#####-##')
        ];
    }
}
