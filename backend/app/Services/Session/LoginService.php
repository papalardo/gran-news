<?php

namespace App\Services\Session;

use Illuminate\Contracts\Auth\Factory as Auth;
use Illuminate\Validation\ValidationException;
use Illuminate\Contracts\Validation\Factory as Validator;
use Illuminate\Contracts\Routing\ResponseFactory as Response;

class LoginService
{
    protected $auth;

    public function __construct(
        Auth $auth,
        Validator $validator,
        Response $response
    )
    {
        $this->auth = $auth;
        $this->validator = $validator;
        $this->response = $response;
    }

    public function validateLoginInfo($data)
    {
        return $this->validator->make($data, [
            'email' => 'required|email',
            'password' => 'required'
        ]);
    }

    public function autenticateResponse($loginInfo)
    {
        try {
            $attempt = $this->attemptLogin($loginInfo);

            if($attempt) {
                $token = $this->auth->user()->createToken('auth_token')->plainTextToken;
                return $this->response->success([
                        'access_token' => $token,
                        'user' => $this->auth->user(),
                    ])
                    ->header('Authorization', $token);
            } else {
                throw ValidationException::withMessages([
                    'email' => ['Invalid credentials']
                ]);
            }
        } catch (ValidationException $e) {
            return $this->response->validateError($e->errors());
        }
    }

    public function attemptLogin($loginInfo)
    {
        $validator = $this->validateLoginInfo($loginInfo);
        if($validator->fails()) {
            throw new ValidationException($validator);
        }

        return $this->auth->attempt($loginInfo);
    }
}
