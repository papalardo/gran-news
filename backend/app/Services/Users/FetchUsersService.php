<?php

namespace App\Services\Users;

use App\Models\User;
use Illuminate\Contracts\Routing\ResponseFactory as Response;
use Illuminate\Http\Request;

class FetchUsersService
{
    protected $repository;

    protected $response;

    protected $request;

    public function __construct(
        User $repository,
        Response $response,
        Request $request
    )
    {
        $this->repository = $repository;
        $this->response = $response;
        $this->request = $request;
    }

    public function getPaginatedResponse()
    {
        return $this->response->success([
            'users' => $this->getPaginated()
        ]);
    }

    public function getPaginated()
    {
        return $this->repository->paginate(20);
    }
}
