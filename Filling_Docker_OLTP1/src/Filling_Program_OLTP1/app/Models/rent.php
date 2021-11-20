<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class rent extends Model
{
    use HasFactory;

    protected $table = 'RENT';
    protected $primaryKey = 'big_id_PK';


    protected $fillable = [
        'big_id_PK',
        'dat_limit_rent',
        'tim_limit_rent',
        'big_service_transaction_FK'
    ];

    public $timestamps = false;
}
