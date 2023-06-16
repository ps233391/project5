<?php

namespace Database\Seeders;

use Database\Factories\ExerciseFactory;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ExerciseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $this->call([
            ExerciseFactory::class,
        ]);
    }
}
