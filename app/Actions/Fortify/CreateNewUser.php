<?php

namespace App\Actions\Fortify;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Laravel\Fortify\Contracts\CreatesNewUsers;
use Illuminate\Http\Request;

class CreateNewUser implements CreatesNewUsers
{
    use PasswordValidationRules;

    /**
     * Validate and create a newly registered user.
     *
     * @param  array  $input
     * @return \App\Models\User
     */
    public function create(array $input)
    {
        Validator::make($input, [
            'name' => ['required', 'string', 'max:255', 'regex:/^[a-zA-Z]+$/u'],
            'country' => ['required', 'string', 'max:255'],
            'email' => [
                'required',
                'string',
                'email',
                'max:255',
                Rule::unique(User::class),
            ],
            'username' => ['required', 'string', 'max:255'],
            'password' => $this->passwordRules(),
            'captcha' => ['required', 'captcha'],
        ])->validate();
        return User::create([
            'name' => $input['name'],
            'country' => $input['country'],
            'status' => 'col',
            'email' => $input['email'],
            'username' => $input['username'],
            'password' => Hash::make($input['password']),
            'register_1' => now(),
        ]);
    }
}
