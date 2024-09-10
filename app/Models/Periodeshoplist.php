<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Periodeshoplist extends Model
{
    use HasFactory;
    protected $fillable = [
        'periode_startdate',
        'periode_enddate',
        'periodeshoplist_name',
        'periodeshoplist_gsnr',
        'periodeshoplist_inputdate',
        'dispatch_id',
        'collection_id',
        'recruitment_id',
        'servicing_id',
        'shopDetail_id',
    ];
}
