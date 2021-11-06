<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class manufacturerFactory extends Factory
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
                'Volkswagen AG', 'Daimler Motor Company', 'Bayerische Motoren', 'Stellantis N.V', 'Groupe Renault', 'Ferrari S.p.A', 'Fiat Chrysler Automobile',
                'General Motors Company', 'Ford Motor Company', 'TOYOTA MOTOR MANUFACTURING', 'MAZDA MOTOR CORPORATIO', 'FCA US LLC', 'Honda Motor Company', 'Jaguar Cars',
                'Volvo Cars Group', 'Infinity(Nissan)', 'Hiundai', 'chevrolet', 'Audi', 'MITSUBISHI MOTORS CORPORATION', 'Nissan Motor Corporation'
            )),
            'var_commonName' => $this->faker->randomElement($array = array ('')),
            'var_postalCode' => $this->faker->unique()->postcode(),
            'tin_location_FK' => $this->faker->numberBetween($min = 0, $max = 5)
        ];
    }
}
