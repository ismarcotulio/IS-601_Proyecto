<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\type_of_isv;
use App\Models\isv;

class isvFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    { 
        $type_of_isv = type_of_isv::all()->random()->tin_id_PK;
        $faker = (new \Faker\Factory())::create();
        $faker->addProvider(new \Faker\Provider\Fakecar($faker));

        return [
            'dec_amount' => $this->faker->numberBetween($min = 1500, $max = 150000),
            'tin_type_of_isv_FK' => $type_of_isv
        ];
    }
}
