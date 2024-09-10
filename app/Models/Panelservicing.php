<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Panelservicing extends Model
{
    use HasFactory;
    protected $fillable = [
        'periode_name',
        'gsnr',
        'panelservicing_method',
        'panelservicing_feedback',
        'panelservicing_startload',
        'panelservicing_inputdate',
        'panelservicing_staffname',
        'panelservicing_image',
        'panelservicing_lat',
        'panelservicing_long',
        'country',
    ];
}
