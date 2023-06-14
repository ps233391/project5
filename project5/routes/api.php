<?php

use App\Http\Controllers\SportsController;

Route::get('/Sports', [SportsController::class, 'index']);
