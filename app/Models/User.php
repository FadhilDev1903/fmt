<?php

namespace App\Models;

use Illuminate\Validation\Rule;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'name',
        'country',
        'status',
        'email',
        'username',
        'password',
        'phone',
        'emp_id',
        'spv_id',
        'admin_approval',
        'image_profile',
        'register_1',
        'register_2',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public static function rules()
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', Rule::unique('users')],
            'password' => ['required', 'string', 'min:8', 'max:13', 'confirmed', 'regex:/[A-Z]/', 'regex:/[!@#$%^&*(),.?":{}|<>]/', 'regex:/[0-9]/'],
        ];
    }

    public static function messages()
    {
        return [
            'password.regex' => 'Password harus mengandung setidaknya satu huruf kapital, satu karakter khusus, dan satu angka.',
        ];
    }

    /**
     * Get the user associated with the User
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function detail(): HasOne
    {
        return $this->hasOne(Userdetail::class, 'id_user', 'id');
    }
}
