<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class vehicle_modelFactory extends Factory
{
    public $id = -1;
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {

        $brand = \App\Models\brand::all()->random();
        $brandId = $brand->big_id_PK;
        $brandName = $brand->var_name;
        $body_class = \App\Models\body_class::all()->random()->tin_id_PK;
        $faker = (new \Faker\Factory())::create();
        $faker->addProvider(new \Faker\Provider\Fakecar($faker));

        $this->id = $this->id + 1;

        return [
            'var_name' => $faker->vehicleModelUnique($brandName),
            'tex_description' => $this->faker->sentence($nbWords = 6, $variableNbWords = true),
            'big_brand_FK' => $brandId,
            'tin_body_class_FK' => $body_class
        ];
    }
}
