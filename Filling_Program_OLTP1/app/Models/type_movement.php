<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class type_movement extends Model
{
    use HasFactory;
    protected $table = 'TYPE_MOVEMENT';
    protected $primaryKey = 'tin_id_PK';


    protected $fillable = [
        'tin_id_PK',
        'var_name',
        'tex_description'
    ];

    public $timestamps = false;
}
