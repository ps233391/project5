<?php
namespace App\Http\Controllers;

use App\Models\Components;
use Illuminate\Http\Request;

class ComponentsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Components::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $exercise = Components::create([
                'name' => $request->name,
            ]);

            return $exercise;
        } catch (\Exception $e) {
            // Handle the exception
            return response()->json(['error' => 'Failed to store the component.'], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Components $components)
    {
        return $components;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Components $components)
    {
        try {
            $components->update($request->all());

            return $components;
        } catch (\Exception $e) {
            // Handle the exception
            return response()->json(['error' => 'Failed to update the component.'], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Components $components)
    {
        try {
            $components->delete();
        } catch (\Exception $e) {
            // Handle the exception
            return response()->json(['error' => 'Failed to delete the component.'], 500);
        }
    }
}
