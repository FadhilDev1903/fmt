<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Expense extends Model
{
    use HasFactory;
    protected $fillable = [
        'claim_date',
        'user_id',
        'department',
        'claim_type',
        'category',
        'item',
        'remarks',
        'currency',
        'project',
        'amount',
        'project_percentage',
        'image',
        'approved_status',
        'approved_by',
        'approved_at',
    ];
}
