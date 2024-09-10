<?php

namespace App\Actions\Fortify;

use Laravel\Fortify\Rules\Password;

trait PasswordValidationRules
{
    /**
     * Get the validation rules used to validate passwords.
     *
     * @return array
     */
    protected function passwordRules()
    {
        return ['required', 'string', 'min:8', 'max:13', 'confirmed', 'regex:/[A-Z]/', 'regex:/[!@#$%^&*(),.?":{}|<>]/', 'regex:/[0-9]/', new Password, 'confirmed'];
    }
}
