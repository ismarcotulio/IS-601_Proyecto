<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class employee extends Model
{
    use HasFactory;

    protected $table = 'EMPLOYEES';
    protected $primaryKey = 'int_employee_id_PK';


    protected $fillable = [
        'int_employee_id_PK',
        'var_code',
        'int_branch_id_FK',
        'int_person_id_FK',
        'int_contract_id_FK',
        'tin_area_id_FK'
    ];

    public $timestamps = false;
}
