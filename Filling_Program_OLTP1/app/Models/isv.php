<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class isv extends Model
{
    use HasFactory;
   
    protected $table = 'ISV';
    protected $primaryKey = 'int_id_PK';


    protected $fillable = [
        'int_id_PK',
        'dec_amount',
        'tin_type_of_isv_FK'
    ];

    public $timestamps = false;
}
