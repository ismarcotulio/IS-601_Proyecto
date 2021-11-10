<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class vehicle_model extends Model
{
    use HasFactory;

    protected $table = 'MODEL';
    protected $primaryKey = 'tin_id_PK';

    protected $fillable = [
        'big_id_PK',
        'var_name',
        'tex_description',
        'big_brand_FK',
        'tin_body_class_FK',
    ];

    public $timestamps = false;
}
