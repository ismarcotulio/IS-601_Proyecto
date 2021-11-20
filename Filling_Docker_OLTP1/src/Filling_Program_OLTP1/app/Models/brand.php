<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class brand extends Model
{
    use HasFactory;

    protected $table = 'BRAND';
    protected $primaryKey = 'big_id_PK';


    protected $fillable = [
        'big_id_PK',
        'var_name',
        'tex_description',
        'int_manufacturer_FK'
    ];

    public $timestamps = false;
}
