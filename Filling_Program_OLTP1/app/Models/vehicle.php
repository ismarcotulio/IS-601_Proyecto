<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class vehicle extends Model
{
    use HasFactory;

    protected $table = 'VEHICLE';
    protected $primaryKey = 'big_id_PK';


    protected $fillable = [
        'big_id_PK',
        'dec_base_price',
        'var_vin',
        'var_engine',
        'var_brake_system',
        'tin_number_cylinders',
        'dec_displacement_cc',
        'var_gvwr',
        'bit_use_state',
        'tex_description',
        'int_year',
        'tin_doors',
        'tin_color_FK',
        'big_model_FK',
        'tin_fuel_type_FK',
        'tin_vehicle_type_FK',
        'tin_transaction_state_FK'
    ];

    public $timestamps = false;
}
