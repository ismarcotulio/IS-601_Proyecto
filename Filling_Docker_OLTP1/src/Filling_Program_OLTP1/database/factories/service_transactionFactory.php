<?php

namespace Database\Factories;

use App\Models\invoice;
use App\Models\service_detail;
use App\Models\service_transaction;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Factories\Factory;
use Carbon\Carbon;

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
            $number_payments = $this->faker->numberBetween(1,3);
            $count = 0;
            $count2 = 0;

            if ($service_transaction->big_id_PK % 2 == 0) {
                $date_limit = Carbon::createFromFormat('Y-m-d', $service_transaction->dat_date_of_issue)->addDays(
                    $this->faker->numberBetween(30,360)
                );
                DB::table('RENT')->insert(
                    [
                        'dat_limit_rent' => $date_limit,
                        'tim_limit_rent' => $service_transaction->tim_time_of_issue,
                        'big_service_transaction_FK' => $service_transaction->big_id_PK
                    ]
                );
            }

            $service_transaction
            ->invoice(null, function(service_transaction $service_transaction){

                $correlative_number = 0;
                $emission_point_id = 0;
                $printing_id = 0;
                $document_type_id = 1;

                $CAI = '';
                $branch_id = 0;
                $client_id = 0;

                $emission_point_number = 0;
                $printing_number = 0;
                $document_type_number = 0;


                $latest_invoice_number = DB::table('INVOICE_NUMBER')->orderBy('big_id_PK', 'desc')->first();
                
                if($latest_invoice_number == null){
                    $correlative_number = 1;
                }else{
                    $correlative_number = $latest_invoice_number->int_correlative_number + 1;
                }

                $emission_point = \App\Models\emission_point::inRandomOrder()->first();
                $emission_point_id = $emission_point->int_id_PK;
                $emission_point_number = $emission_point->int_number;

                $printing = \App\Models\printing::inRandomOrder()->first();
                $printing_id = $printing->int_id_PK;
                $printing_number = $printing->var_authorization_number;
                
                $invoice_number_id = DB::table('INVOICE_NUMBER')->insertGetId(
                    [
                        'int_correlative_number' => $correlative_number,
                        'int_emission_point_FK' => $emission_point_id,
                        'int_printing_FK' => $printing_id,
                        'tin_document_type_FK' => $document_type_id
                    ]
                );

                $client_id = \App\Models\client::inRandomOrder()->first()->big_client_id_PK;

                $branch_id = \App\Models\employee::where('int_employee_id_PK', $service_transaction->int_employees_FK)->first()->tin_branch_id_FK;

                $CAI = sprintf("%d-%s-%d-%d", $emission_point_number, $printing_number, $document_type_number, $correlative_number);

                return [
                    'var_CAI' => $CAI,
                    'dat_deadline' => $service_transaction->dat_date_of_issue,
                    'tim_deadline' => $service_transaction->tim_time_of_issue,
                    'tin_branch_FK' => $branch_id,
                    'big_service_transaction_FK' => $service_transaction->big_id_PK,
                    'big_invoice_number_FK' => $invoice_number_id,
                    'big_client_FK' => $client_id
                ];


            });

            while($count < $numberDetails){
                $service_transaction
                ->service_details($numberDetails, function (service_transaction $service_transaction) {

                                $price = $this->faker->randomFloat($nbMaxDecimals = NULL, $min = 20000, $max = 90000);
                                $exempt = $this->faker->randomFloat($nbMaxDecimals = NULL, $min = 200, $max = 2000);
                                $vehicle = \App\Models\vehicle::where('tin_transaction_state_FK', 1)->orderBy('int_year')->first();
                                
                                $verify_detail = \App\Models\service_detail::where('big_vehicle_FK', $vehicle->big_id_PK)->first();

                                while($verify_detail != null){
                                    $vehicle = \App\Models\vehicle::find($vehicle->big_id_PK+1);
                                    $verify_detail = \App\Models\service_detail::where('big_vehicle_FK', $vehicle->big_id_PK)->first();
                                }

                                $dateIssue = sprintf("%d-0%d-01", ($vehicle->int_year+1), $this->faker->numberBetween(1,9));
                                $subTotal = $service_transaction->mon_subtotal + $price;
                                $totalPay = $subTotal - ($subTotal*$service_transaction->discount/100) - $service_transaction->reduction;

                                $service_transaction->update([
                                    'dat_date_of_issue' => $dateIssue,
                                    'mon_subtotal' => $subTotal,
                                    'mon_total_to_pay' => $totalPay
                                ]);

                                DB::table('RENT')->where('big_service_transaction_FK', $service_transaction->big_id_PK)->update([
                                    'dat_limit_rent' => Carbon::createFromFormat('Y-m-d', $dateIssue)->addDays(
                                        $this->faker->numberBetween(30,360)
                                    ) 
                                ]);

                                return [
                                    'mon_price' => $price,
                                    'mon_exempt_value' => $exempt,
                                    'mon_total' => ($price-$exempt),
                                    'big_vehicle_FK' => $vehicle->big_id_PK,
                                ];
                            });
                            $latest_service_detail = DB::table('SERVICE_DETAIL')->orderBy('big_id_PK', 'desc')->first();
                            $branch_id = DB::table('VEHICLE_MOVEMENT')->where('big_vehicle_FK', $latest_service_detail->big_vehicle_FK)->orderBy('big_id_PK', 'desc')->first()->tin_branch_FK;
                            if ($service_transaction->big_id_PK % 2 == 0) {
                                $rent =  DB::table('RENT')->where('big_service_transaction_FK', $service_transaction->big_id_PK)->orderBy('big_id_PK', 'desc')->first();
                                
                                DB::table('VEHICLE_MOVEMENT')->insert(
                                    [
                                        'dat_dueDate' => $service_transaction->dat_date_of_issue,
                                        'tim_dueTime' => $service_transaction->tim_time_of_issue,
                                        'tin_type_movement_FK' => 5,
                                        'tin_branch_FK' => $branch_id,
                                        'big_vehicle_FK' => $latest_service_detail->big_vehicle_FK
                                    ]
                                );
                                
                                DB::table('VEHICLE_MOVEMENT')->insert(
                                    [
                                        'dat_dueDate' => Carbon::createFromFormat('Y-m-d', $service_transaction->dat_date_of_issue)->addDays(1),
                                        'tim_dueTime' => $service_transaction->tim_time_of_issue,
                                        'tin_type_movement_FK' => 4,
                                        'tin_branch_FK' => $branch_id,
                                        'big_vehicle_FK' => $latest_service_detail->big_vehicle_FK
                                    ]
                                );

                                DB::table('VEHICLE_MOVEMENT')->insert(
                                    [
                                        'dat_dueDate' => $rent->dat_limit_rent,
                                        'tim_dueTime' => $rent->tim_limit_rent,
                                        'tin_type_movement_FK' => 1,
                                        'tin_branch_FK' => $branch_id,
                                        'big_vehicle_FK' => $latest_service_detail->big_vehicle_FK
                                    ]
                                );

                                DB::table('VEHICLE_MOVEMENT')->insert(
                                    [
                                        'dat_dueDate' => Carbon::createFromFormat('Y-m-d', $rent->dat_limit_rent)->addDays(1),
                                        'tim_dueTime' => $rent->tim_limit_rent,
                                        'tin_type_movement_FK' => 2,
                                        'tin_branch_FK' => $branch_id,
                                        'big_vehicle_FK' => $latest_service_detail->big_vehicle_FK
                                    ]
                                );
                            }else{
                                DB::table('VEHICLE_MOVEMENT')->insert(
                                    [
                                        'dat_dueDate' => $service_transaction->dat_date_of_issue,
                                        'tim_dueTime' => $service_transaction->tim_time_of_issue,
                                        'tin_type_movement_FK' => 3,
                                        'tin_branch_FK' => $branch_id,
                                        'big_vehicle_FK' => $latest_service_detail->big_vehicle_FK
                                    ]
                                );

                                DB::table('VEHICLE_MOVEMENT')->insert(
                                    [
                                        'dat_dueDate' => Carbon::createFromFormat('Y-m-d', $service_transaction->dat_date_of_issue)->addDays(1),
                                        'tim_dueTime' => $service_transaction->tim_time_of_issue,
                                        'tin_type_movement_FK' => 4,
                                        'tin_branch_FK' => $branch_id,
                                        'big_vehicle_FK' => $latest_service_detail->big_vehicle_FK
                                    ]
                                );

                                DB::table('VEHICLE')->where('big_id_PK',$latest_service_detail->big_vehicle_FK)->update(
                                    [
                                        'tin_transaction_state_FK' => 2
                                    ]
                                );
                            }
                            
                            $count++;
            }
            $invoice = invoice::where('big_service_transaction_FK', $service_transaction->big_id_PK)
            ->first();

            while($count2 < $number_payments){
                $invoice 
                ->payment($number_payments, $service_transaction, function(invoice $invoice, service_transaction $service_transaction, $number_payments){

                    $type_of_method_id = \App\Models\type_of_methods::inRandomOrder()->first()->tin_id_PK;

                    $amount = $service_transaction->mon_total_to_pay/$number_payments;

                    return [
                        'mon_amount' => $amount,
                        'tin_type_of_method_FK' => $type_of_method_id,
                        'big_invoice_FK' => $invoice->big_id_PK
                    ];
                });
                $count2++;
            }
        });
    }
}
