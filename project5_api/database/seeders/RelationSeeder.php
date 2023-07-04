<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RelationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('relations')->insert([
            'name' => 'test',
            'exercise_id' => '1',
            'user_id' => '1',
            'components_id' => '1',
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
    ]);
    }
}
