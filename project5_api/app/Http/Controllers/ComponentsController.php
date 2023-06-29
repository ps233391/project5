<?php

namespace App\Http\Controllers;

use App\Models\components;
use Illuminate\Http\Request;

class ComponentsController extends Controller
{
   /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return components::all();
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $exercise = components::create([
            'name' => $request->name,
        ]);

        return $exercise;
    }

    /**
     * Display the specified resource.
     */
    public function show(components $components)
    {
        return $components;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, components $components)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(components $components)
    {
        $components->delete();
    }
}