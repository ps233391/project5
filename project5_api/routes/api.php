<?php
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\ComponentsController;
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

Route::group(['middleware' => ['auth:sanctum']], function () {

    // PROTECTED ROUTES
    
    Route::get('profile', function(Request $request) { return auth()->user();});
    
    // Route::post('/logout', [AuthenticationController::class, 'logout']);
    Route::post('/components', [ComponentsController::class, 'store']);
    
    });

Route::get('/exercise', [ExerciseController::class, 'index']);
Route::post('/exercise', [ExerciseController::class, 'store']);
Route::get('/exercise/{exercise}', [ExerciseController::class, 'show']);
Route::put('/exercise/{exercise}', [ExerciseController::class, 'update']);

Route::delete('/exercise/{exercise}/components/{components}', [ExerciseController::class, 'destroycomponent']);
Route::delete('/exercise/{exercise}', [ExerciseController::class, 'destroy']);



Route::get('/components', [ComponentsController::class, 'index']);

Route::get('/components/{components}', [ComponentsController::class, 'show']);
Route::put('/components/{components}', [ComponentsController::class, 'update']);
Route::delete('/components/{components}', [ComponentsController::class, 'destroy']);



Route::post('/auth/register', [AuthController::class, 'createUser']);
Route::post('/auth/login', [AuthController::class, 'loginUser']);


// Route::apiResource('posts', PostController::class)->middleware('auth:sanctum');