<?php

namespace App\Http\Controllers;

use App\Models\exercise;
use Illuminate\Http\Request;

class ExerciseController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return exercise::all();
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $exercise = exercise::create([
            'name' => $request->name,
            'description' => $request->description,
        ]);

        return $exercise;
    }

    /**
     * Display the specified resource.
     */
    public function show(exercise $exercise)
    {
         return $exercise;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, exercise $exercise)
    {
      $exercise->update($request->all());
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(exercise $exercise)
    {
        $exercise->delete();
    }
}
