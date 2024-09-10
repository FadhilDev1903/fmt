<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Projectdetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'project_id',
        'user_id',
        'salary',
        'country',
    ];
}
