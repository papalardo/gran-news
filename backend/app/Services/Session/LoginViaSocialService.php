<?php

namespace App\Services\Session;

use App\Models\User;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Contracts\Auth\Factory as Auth;
use Illuminate\Validation\ValidationException;
use Illuminate\Contracts\Validation\Factory as Validator;
use Illuminate\Contracts\Routing\ResponseFactory as Response;

class LoginViaSocialService
{
    protected $auth;
    protected $validator;
    protected $response;
    protected $repository;

    public function __construct(
        Auth $auth,
        Validator $validator,
        Response $response,
        User $repository,
    )
    {
        $this->auth = $auth;
        $this->validator = $validator;
        $this->response = $response;
        $this->repository = $repository;
    }

    public function validateInfo($data)
    {
        return $this->validator->make($data, [
            'token' => 'required',
            'provider' => 'required',
        ]);
    }

    public function autenticateResponse($token, $provider)
    {
        try {
            $attempt = $this->attemptViaToken($token, $provider);

            $token = $this->auth->user()->createToken('auth_token')->plainTextToken;
            return $this->response->success([
                    'access_token' => $token,
                    'user' => $this->auth->user(),
                ])
                ->header('Authorization', $token);

        } catch (ValidationException $e) {
            return $this->response->validateError($e->errors());
        }
    }

    public function attemptViaToken($token, $provider)
    {
        $validator = $this->validateInfo([
            'token' => $token,
            'provider' => $provider,
        ]);

        if($validator->fails()) {
            throw new ValidationException($validator);
        }

        $providerUser = Socialite::driver($provider)->userFromToken($token);

        $user = $this->repository->updateOrCreate(['email' => $providerUser->getEmail()], [
            'name' => $providerUser->getName(),
            'password' => bcrypt(uniqid())
        ]);

        return $this->auth->login($user);
    }
}
