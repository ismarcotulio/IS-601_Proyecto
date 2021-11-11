<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class printing extends Model
{
    use HasFactory;

    protected $table = 'PRINTING';
    protected $primaryKey = 'int_id_PK';
    public $timestamps = false;

    protected $fillable = [
        'int_id_PK',
        'var_code',
        'var_authorization_number'  
    ];
}
