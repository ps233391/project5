<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            'name' => 'Rik',
            'email' => 'Rikzande@gmail.com',
            'password' => 'd9b5f58f0b38198293971865a14074f59eba3e82595becbe86ae51f1d9f1f65e',
        ]);
    }
}
