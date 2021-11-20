<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class vehicleFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $color = \App\Models\color::all()->random()->tin_id_PK;
        $model = \App\Models\vehicle_model::all()->random()->big_id_PK;
        $fuel_type = \App\Models\fuel_type::all()->random()->tin_id_PK;
        $vehicle_type = \App\Models\vehicle_type::all()->random()->tin_id_PK;
        $transaction_state = 4;

        $faker = (new \Faker\Factory())::create();
        $faker->addProvider(new \Faker\Provider\Fakecar($faker));

        return [
            'dec_base_price' => $this->faker->numberBetween($min = 10000, $max = 250000),
            'var_vin' => $faker->vin(),
            'var_engine' => $this->faker->sentence($nbWords = 3, $variableNbWords = true),
            'var_brake_system' => 'hidraulic',
            'tin_number_cylinders' => $this->faker->randomElement($array = array (4,6,8)),
            'dec_displacement_cc' => $this->faker->numberBetween($min = 10000, $max = 250000),
            'var_gvwr' => $this->faker->sentence($nbWords = 6, $variableNbWords = true),
            'bit_use_state' => $this->faker->randomElement($array = array (0,1)),
            'tex_description' => $this->faker->sentence($nbWords = 10, $variableNbWords = true),
            'int_year' => $this->faker->numberBetween($min = 1998, $max = 2021),
            'tin_doors' => $faker-> vehicleDoorCount(),
            'tin_color_FK' => $color,
            'big_model_FK' => $model,
            'tin_fuel_type_FK' => $fuel_type,
            'tin_vehicle_type_FK' => $vehicle_type,
            'tin_transaction_state_FK' => $transaction_state
        ];
    }
}
