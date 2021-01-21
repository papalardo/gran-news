<?php

namespace App\Http\Controllers\Api\v1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\Auth\RegistrationService;
use App\Services\Session\LoginService;
use App\Services\Session\LoginViaSocialService;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        return resolve(LoginService::class)->autenticateResponse(
            $request->only('email', 'password')
        );
    }

    public function register(Request $request)
    {
        return resolve(RegistrationService::class)->regitrationResponse(
            $request->only([
                'first_name',
                'last_name',
                'email',
                'password',
                'password_confirmation',
            ])
        );
    }

    public function loginWithGoogle(Request $request)
    {
        return resolve(LoginViaSocialService::class)
            ->autenticateResponse($request->token, 'google');
    }
}
