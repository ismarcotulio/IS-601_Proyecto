<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class emission_point extends Model
{
    use HasFactory;

    protected $table = 'EMISSION_POINT';
    protected $primaryKey = 'tin_id_PK';
    public $timestamps = false;

    protected $fillable = [
        'int_id_PK',
        'var_modality',
        'int_number'
    ];
}
