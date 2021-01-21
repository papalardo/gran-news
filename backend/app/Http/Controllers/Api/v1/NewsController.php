<?php

namespace App\Http\Controllers\Api\v1;

use App\Models\News;
use App\Http\Controllers\Controller;
use App\Http\Resources\v1\NewsResource;

class NewsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(
        News $repository
    )
    {
        return NewsResource::collection(
            $repository->paginate(10)
        );
    }
}
