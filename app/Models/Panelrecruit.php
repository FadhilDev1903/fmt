<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Panelrecruit extends Model
{
    use HasFactory;
    protected $fillable = [
        'periode_name',
        'shopname',
        'shoptype',
        'shopsize',
        'address',
        'city',
        'status',
        'reason',
        'startload',
        'inputdate',
        'staffname',
        'image',
        'lat',
        'long',
        'country',
    ];
}
