<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\components;
use App\Models\exercise;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $user = exercise::factory()->create([
            'name' => 'Squat',
            'description' => 'Bij een Squat strek je je armen vooruit en zet je je benen wijt. Daarna zak je naar beneden en gaat weer terug omhoog.',
        ]);


        $user = exercise::factory()->create([
            'name' => 'Push up',
            'description' => '',
        ]);

        $user = exercise::factory()->create([
            'name' => 'Dip',
            'description' => '',
        ]);

        
        $user = exercise::factory()->create([
            'name' => 'Plank',
            'description' => '',
        ]);

        $user = exercise::factory()->create([
            'name' => 'Paardentrap',
            'description' => '',
        ]);

        
        $user = exercise::factory()->create([
            'name' => 'Mountain climber',
            'description' => '',
        ]);

        $user = exercise::factory()->create([
            'name' => 'Burpee',
            'description' => '',
        ]);

        
        $user = exercise::factory()->create([
            'name' => 'Lunge',
            'description' => '',
        ]);


        $user = exercise::factory()->create([
            'name' => 'Wall sit',
            'description' => '',
        ]);

        
        $user = exercise::factory()->create([
            'name' => 'Crunch',
            'description' => '',
        ]);
        $user = components::factory()->create([
            'name' => 'Cardio',
        ]);

        $user = components::factory()->create([
            'name' => 'Shoulder',
        ]);

        $user = components::factory()->create([
            'name' => 'Arms',
        ]);

        $user = components::factory()->create([
            'name' => 'Bunda',
        ]);

        $user = components::factory()->create([
            'name' => 'Legs',
        ]);
    }
}
