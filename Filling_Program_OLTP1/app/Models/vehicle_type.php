<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class vehicle_type extends Model
{
    use HasFactory;
    protected $table = 'VEHICLE_TYPE';
    protected $primaryKey = 'tin_id_PK';

    protected $fillable = [
        'var_name',
        'tex_description',
    ];

    public $timestamps = false;
}
