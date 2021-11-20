<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class type_movementFactory extends Factory
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

        $array = array ('arrive', 'in inventory', 'sold', 'delivered', 'rented');
        return [
            'var_name' => $array[$this->id],
                'tex_description' => $this->faker->text($maxNbChars = 200)
        ];
    }
}
