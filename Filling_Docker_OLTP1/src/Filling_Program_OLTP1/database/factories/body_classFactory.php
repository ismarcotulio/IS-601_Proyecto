<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class body_classFactory extends Factory
{
    public $id = -1;
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {

        $faker = (new \Faker\Factory())::create();
        $faker->addProvider(new \Faker\Provider\Fakecar($faker));
        $this->id = $this->id + 1;

        return [
            'var_name' => $faker->vehicleBodyClass($this->id),
            'tex_description' => $this->faker->sentence($nbWords = 6, $variableNbWords = true)
        ];
    }
}
