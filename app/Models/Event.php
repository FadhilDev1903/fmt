<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Event extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'title',
        'start',
        'end',
        'submit',
        'submit_by',
        'submit_at',
        'approved_status',
        'approved_by',
        'approved_at'
    ];

    /**
     * Get the user associated with the Event
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function user(): HasOne
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }

    /**
     * Get the user associated with the Event
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function financial(): HasOne
    {
        return $this->hasOne(FinancialDetailModel::class, 'user_id', 'user_id');
    }
}
