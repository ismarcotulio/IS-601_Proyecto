<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class invoice extends Model
{
    use HasFactory;

    protected $table = 'INVOICE';
    protected $primaryKey = 'big_id_PK';


    protected $fillable = [
        'big_id_PK',
        'var_CAI',
        'dat_deadlineDate',
        'tin_branch_FK',
        'big_service_transaction_FK',
        'big_invoice_number_FK',
        'big_client_FK',
    ];

    public $timestamps = false;
}
