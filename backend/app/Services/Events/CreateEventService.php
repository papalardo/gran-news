<?php

namespace App\Services\Events;

use App\Models\Event;
use App\Http\Resources\v1\EventResource;
use Illuminate\Contracts\Auth\Factory as Auth;
use Illuminate\Validation\ValidationException;
use Illuminate\Contracts\Validation\Factory as Validator;
use Illuminate\Contracts\Routing\ResponseFactory as Response;

class CreateEventService
{
    protected $auth;
    protected $validator;
    protected $response;
    protected $eventRepository;

    public function __construct(
        Auth $auth,
        Validator $validator,
        Response $response,
        Event $eventRepository
    )
    {
        $this->auth = $auth;
        $this->validator = $validator;
        $this->response = $response;
        $this->eventRepository = $eventRepository;
    }

    /**
     * @param   array $data
     * @return  \Illuminate\Contracts\Validation\Validator
     */
    public function validate(array $data)
    {
        return $this->validator->make($data, [
            'name' => 'required',
            'category_id' => 'required',
            'start_at' => 'date_format:Y-m-d H:s',
        ]);
    }

    /**
     * @param   array $data
     * @return  \Illuminate\Http\Response
     */
    public function createEventResponse(array $data)
    {
        try {
            $eventCreated = $this->createEvent($data);

            return new EventResource($eventCreated);
        } catch (ValidationException $e) {
            return $this->response->validateError($e->errors());
        }
    }

    /**
     * @param   array $data
     * @return  \App\Models\Event
     */
    public function createEvent(array $data)
    {
        $validator = $this->validate($data);

        if($validator->fails()) {
            throw new ValidationException($validator);
        }

        return $this->eventRepository->create($data);
    }
}
