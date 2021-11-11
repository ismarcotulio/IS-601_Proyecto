<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class document_type extends Model
{
    use HasFactory;

    protected $table = 'DOCUMENT_TYPE';
    protected $primaryKey = 'tin_id_PK';
    public $timestamps = false;

    protected $fillable = [
        'tin_id_PK',
        'int_number',
        'var_code',
        'var_name'  
    ];
}
