<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class type_of_isv extends Model
{
    use HasFactory;

    protected $table = 'TYPE_OF_ISV';
    protected $primaryKey = 'tin_id_PK';
    public $timestamps = false;

    protected $fillable = [
        'tin_id_PK',
        'var_name',
        'tin_percent'
    ];
}
