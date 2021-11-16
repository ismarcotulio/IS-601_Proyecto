<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class service_transaction extends Model
{
    use HasFactory;

    protected $table = 'SERVICE_TRANSACTION';
    protected $primaryKey = 'big_id_PK';


    protected $fillable = [
        'big_id_PK',
        'dat_date_of_issue',
        'tim_time_of_issue',
        'mon_subtotal',
        'tin_discount',
        'mon_reduction',
        'mon_total_to_pay',
        'int_isv_FK',
        'int_employees_FK'
    ];

    public $timestamps = false;

    public function service_details($quantity, $callback)
    {

            $this->hasMany(service_detail::class, 'big_service_transaction_FK', 'big_id_PK')->create($callback($this));

    }
}
