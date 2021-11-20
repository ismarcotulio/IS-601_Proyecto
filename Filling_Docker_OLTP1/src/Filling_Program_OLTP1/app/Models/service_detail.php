<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class service_detail extends Model
{
    use HasFactory;

    protected $table = 'SERVICE_DETAIL';
    protected $primaryKey = 'big_id_PK';


    protected $fillable = [
        'big_id_PK',
        'mon_price',
        'mon_exempt_value',
        'mon_total',
        'big_vehicle_FK',
        'big_service_transaction_FK'
    ];

    public $timestamps = false;

    public function service_transaction()
    {
        return $this->belongsTo(service_transaction::class, 'big_service_transaction_FK', 'big_id_PK');
    }
}
