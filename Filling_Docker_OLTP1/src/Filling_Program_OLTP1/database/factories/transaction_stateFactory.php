<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class transaction_stateFactory extends Factory
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
                'In Inventory','Returned','For shipment','In inspection','sold','In rent'

                )),
                'tex_description' => $this->faker->sentence($nbWords = 8, $variableNbWords = true)

        ];
    }
}
