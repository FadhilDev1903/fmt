<?php

namespace App\Models;

use App\Models\Shoplist;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Collection extends Model
{
    use HasFactory;
    protected $fillable = [
        'periode_name',
        'gsnr',
        'collection_status',
        'collection_reason',
        'collection_pgfill',
        'collection_newmodel',
        'collection_remind',
        'collection_display',
        'collection_missing',
        'collection_feedback',
        'collection_startload',
        'collection_dateinput',
        'collection_staffname',
        'collection_image',
        'collection_lat',
        'collection_long',
        'country'
    ];

    public function shoplist()
    {
        return $this->hasOne(Shoplist::class, 'gsnr', 'gsnr');
    }
}
