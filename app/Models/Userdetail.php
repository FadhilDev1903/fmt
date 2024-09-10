<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Userdetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'id_user',
        'id_card_number',
        'id_card_file',
        'tax_card_number',
        'tax_card_file',
        'bank_full_name',
        'bank_code',
        'bank_account_number',
        'bank_book',
        'marital_status',
        'family_card',
        'address',
        'created_at'
    ];
}
