<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class manufacturer extends Model
{
    use HasFactory;

    protected $table = 'MANUFACTURER';
    protected $primaryKey = 'int_id_PK';
    public $timestamps = false;

    protected $fillable = [
        'int_id_PK',
        'var_name',
        'var_commonName',
        'var_postalCode',
        'tin_location_FK'
    ];
}
