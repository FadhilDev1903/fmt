<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Adhocproject extends Model
{
    use HasFactory;

    protected $encryptable = [
        'id',
    ];

    protected $fillable = [
        'parent_id',
        'wbs_number',
        'cost_center',
        'name',
        'description',
        'remark',
        'manage',
        'budget',
        'startdate',
        'enddate',
        'country',
    ];
}
