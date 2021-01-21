<?php

namespace App\Services\Auth;

use App\Models\User;
use Illuminate\Validation\ValidationException;
use Illuminate\Contracts\Validation\Factory as Validator;
use Illuminate\Contracts\Routing\ResponseFactory as Response;

class RegistrationService
{
    protected $repository;

    public function __construct(
        User $repository,
        Validator $validator,
        Response $response
    ) {
        $this->repository = $repository;
        $this->validator = $validator;
        $this->response = $response;
    }

    public function registrationValidator(array $data)
    {
        return $this->validator->make($data, [
            'first_name' => 'required|min:3',
            'last_name' => 'required|min:3',
            'email' => 'required|email|unique:App\Models\User',
            'password' => 'required|confirmed',
        ]);
    }

    public function regitrationResponse(array $data)
    {
        try {
            if($userRegistred = $this->registerUser($data)) {
                return $this->response->success([
                    'message' => 'User registred succesfully',
                    'user' => $userRegistred,
                ]);
            }
            $this->response->error('Error at register user');
        } catch (ValidationException $e) {
            return $this->response->validateError($e->errors());
        }
    }

    public function registerUser(array $data)
    {
        $validator = $this->registrationValidator($data);

        if($validator->fails()) {
            throw new ValidationException($validator);
        }

        $validated = $validator->validated();
        $validated['password'] = bcrypt($validated['password']);

        return $this->repository->create($validated);
    }
}
