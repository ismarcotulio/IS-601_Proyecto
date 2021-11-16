<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class payment extends Model
{
    use HasFactory;

    protected $table = 'PAYMENT';
    protected $primaryKey = 'big_id_PK';


    protected $fillable = [
        'big_id_PK',
        'mon_amount',
        'tin_type_of_method_FK',
        'big_invoice_FK'
    ];

    public $timestamps = false;
}
