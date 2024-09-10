<?php

namespace App\Http\Middleware;

use Closure;
use HTMLPurifier;
use HTMLPurifier_Config;

class SanitizeInput
{
    protected $purifier;

    public function __construct()
    {
        $config = HTMLPurifier_Config::createDefault();
        $this->purifier = new HTMLPurifier($config);
    }

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $input = $request->all();

        // Loop through input and purify each field
        array_walk_recursive($input, function (&$input) {
            $input = $this->purifier->purify($input);
        });

        // Replace request input with sanitized input
        $request->merge($input);

        return $next($request);
    }
}
