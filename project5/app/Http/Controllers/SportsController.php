<?php

namespace App\Http\Controllers;

use App\Models\Sports;


class SportsController extends Controller
{

    public function index()
    {
        $greeting = 'Hello, World!';
        return response()->json(['message' => $greeting]);
    }

}
