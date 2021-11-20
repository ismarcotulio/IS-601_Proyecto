<?php


namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\manufacturer;
use App\Models\brand;


class brandFactory extends Factory
{
    public $id = -1;


    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {


        $manufacturer = manufacturer::all()->random()->int_id_PK;
        $faker = (new \Faker\Factory())::create();
        $faker->addProvider(new \Faker\Provider\Fakecar($faker));

        $this->id = $this->id + 1;

        return [
            'var_name' => $faker->vehicleBrandUnique($this->id),
            'tex_description' => $this->faker->sentence($nbWords = 6, $variableNbWords = true),
            'int_manufacturer_FK' => $manufacturer
        ];
    }


}
