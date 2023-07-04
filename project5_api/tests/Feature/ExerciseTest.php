<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ExerciseTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_example(): void
    {
    
    $response = $this->get('http://localhost:8000/api/exercise/1');
    
    $response->assertStatus(200);
    
    $response->assertJson(['name'=>'test1','description'=>'tester',]);
    
    }
}
