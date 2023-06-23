<?php

use App\Http\Controllers\ExerciseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/exercise', [ExerciseController::class, 'index']);
Route::post('/exercise', [ExerciseController::class, 'store']);
Route::get('/exercise/{exercise}', [ExerciseController::class, 'show']);
Route::put('/exercise/{exercise}', [ExerciseController::class, 'update']);
Route::delete('/exercise/{exercise}', [ExerciseController::class, 'destroy']);
