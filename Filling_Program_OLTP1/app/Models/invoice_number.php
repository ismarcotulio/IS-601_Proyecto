<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class invoice_number extends Model
{
    use HasFactory;

    protected $table = 'INVOICE_NUMBER';
    protected $primaryKey = 'big_id_PK';
    public $timestamps = false;


    protected $fillable = [
        'big_id_PK',
        'int_correlative_number',
        'int_emission_point_FK',
        'int_printing_FK',
        'tin_document_type_FK'
    ];
}
