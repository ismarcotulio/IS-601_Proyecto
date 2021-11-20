<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class color extends Model
{
    use HasFactory;

    protected $table = 'COLOR';
    protected $primaryKey = 'tin_id_PK';


    protected $fillable = [
        'tin_id_PK',
        'var_name'
    ];

    public $timestamps = false;
}
