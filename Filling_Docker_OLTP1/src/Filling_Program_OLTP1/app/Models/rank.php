<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class rank extends Model
{
    use HasFactory;

       
    protected $table = 'RANK';
    protected $primaryKey = 'int_id_PK';
    public $timestamps = false;


    protected $fillable = [
        'int_id_PK',
        'int_starting_range',
        'int_final_range',
        'int_current',
        'dat_dueDate',
        'tim_duetime',
        'bit_active',
        'tin_document_type_FK'
    ];
}
