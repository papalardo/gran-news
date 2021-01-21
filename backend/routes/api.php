<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\v1\NewsController;
use App\Http\Controllers\Api\v1\EventsController;

Route::get('/login', function() {
    return null;
})->name('login');


Route::prefix('auth')->group(function() {
    Route::middleware('throttle:3,1')
    ->post('login', [App\Http\Controllers\Api\v1\AuthController::class, 'login']);
    Route::post('login/google', [App\Http\Controllers\Api\v1\AuthController::class, 'loginWithGoogle']);

    Route::post('register', [App\Http\Controllers\Api\v1\AuthController::class, 'register']);

    Route::middleware('auth:api')->get('/user', function (Request $request) {
        return $request->user();
    });
});

Route::apiResource('news', NewsController::class);

Route::middleware('auth:api')->group(function() {
    Route::apiResource('events', EventsController::class);
});