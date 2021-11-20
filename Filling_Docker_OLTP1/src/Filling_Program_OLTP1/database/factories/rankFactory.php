<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\document_type;
use App\Models\rank;

class rankFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $document_type = document_type::all()->random()->tin_id_PK;
        $faker = (new \Faker\Factory())::create();
        $faker->addProvider(new \Faker\Provider\Fakecar($faker));
        $start = $this->faker->numberBetween($min = 101000001, $max = 101050001);

        return [
            'int_starting_range' => $start,
            'int_final_range' => ($start + 49999),
            'int_current' => $start,
            'dat_dueDate' => $this->faker->date($format = 'Y-m-d', $max = 'now'),
            'tim_duetime' => $this->faker->time($format = 'H:i:s', $max = 'now'),
            'bit_active' => $this->faker->boolean(),
            'tin_document_type_FK' => $document_type
        ];
    }
}
