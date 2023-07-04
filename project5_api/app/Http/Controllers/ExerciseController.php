<?php

namespace App\Http\Controllers;

use App\Models\components;
use App\Models\exercise;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

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
        try {
            $this->validate($request, [
                'name' => 'required|string|max:255',
                'description' => 'required|string',
            ]);

            $exercise = exercise::create([
                'name' => $request->name,
                'description' => $request->description,
            ]);

            return $exercise;
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        }
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
        try {
            $this->validate($request, [
                'name' => 'required|string|max:255',
                'description' => 'required|string',
            ]);

            $exercise->update($request->all());

            return $exercise;
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(exercise $exercise)
    {
        $exercise->delete();
    }

    public function destroycomponent(exercise $exercise, components $components)
    {
        $exercise->delete();
        $components->delete();
    }
}
