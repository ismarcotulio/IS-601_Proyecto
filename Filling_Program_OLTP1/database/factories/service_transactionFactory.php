<?php

namespace Database\Factories;

use App\Models\service_detail;
use App\Models\service_transaction;
use Illuminate\Database\Eloquent\Factories\Factory;

class service_transactionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {

        $dateIssue = '1990-01-01';
        $timeIssue = \Carbon\Carbon::now();
        $subTotal = 0;
        $discount = $this->faker->numberBetween(1,6);
        $reduction = $this->faker->numberBetween(1,1000);
        $totalPay = $subTotal - ($subTotal*$discount/100) - $reduction;
        $int_isv_FK = \App\Models\isv::all()->random()->int_id_PK;
        $int_employees_FK = \App\Models\employee::all()->random()->int_employee_id_PK;

        return [
            'dat_date_of_issue' => $dateIssue,
            'tim_time_of_issue' => $timeIssue,
            'mon_subtotal' => $subTotal,
            'tin_discount' => $discount,
            'mon_reduction' => $reduction,
            'mon_total_to_pay' => $totalPay,
            'int_isv_FK' => $int_isv_FK,
            'int_employees_FK' =>  $int_employees_FK
        ];
    }

    public function configure()
    {
        return $this->afterMaking(function (service_transaction $service_transaction) {
            //
        })->afterCreating(function (service_transaction $service_transaction) {
            $numberDetails = $this->faker->numberBetween(1,3);
            $count = 0;

            while($count < $numberDetails){
                $service_transaction
                ->service_details($numberDetails, function (service_transaction $service_transaction) {

                                $price = $this->faker->randomFloat($nbMaxDecimals = NULL, $min = 20000, $max = 90000);
                                $exempt = $this->faker->randomFloat($nbMaxDecimals = NULL, $min = 200, $max = 2000);
                                $vehicle = \App\Models\vehicle::where('tin_transaction_state_FK', 4)->orderBy('int_year')->first();

                                $dateIssue = sprintf("%d-0%d-01", ($vehicle->int_year+1), $this->faker->numberBetween(1,9));
                                $subTotal = $service_transaction->mon_subtotal + $price;
                                $totalPay = $subTotal - ($subTotal*$service_transaction->discount/100) - $service_transaction->reduction;

                                $service_transaction->update([
                                    'dat_date_of_issue' => $dateIssue,
                                    'mon_subtotal' => $subTotal,
                                    'mon_total_to_pay' => $totalPay
                                ]);

                                return [
                                    'mon_price' => $price,
                                    'mon_exempt_value' => $exempt,
                                    'mon_total' => ($price-$exempt),
                                    'big_vehicle_FK' => $vehicle->big_id_PK,
                                ];
                            });
                            $count++;
            }
        });
    }
}
