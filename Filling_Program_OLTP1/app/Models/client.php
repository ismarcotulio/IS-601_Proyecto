<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class client extends Model
{
    use HasFactory;

    protected $table = 'CLIENT';
    protected $primaryKey = 'big_client_id_PK';


    protected $fillable = [
        'big_client_id_PK',
        'var_code',
        'var_RTN_Personal'
    ];

    public $timestamps = false;
}
