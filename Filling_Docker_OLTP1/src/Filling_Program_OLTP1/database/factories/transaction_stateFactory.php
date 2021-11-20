<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class transaction_stateFactory extends Factory
{
    public $id = -1;
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $this->id = $this->id + 1;
        $array = array ('In Inventory','sold','rented');
        return [
            'var_name' => $array[$this->id],
            'tex_description' => $this->faker->sentence($nbWords = 8, $variableNbWords = true)

        ];
    }
}
