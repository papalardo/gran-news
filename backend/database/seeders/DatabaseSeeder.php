<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\User::create([
            'name' => 'teste',
            'email' => 'teste@teste.com',
            'password' => bcrypt('p@ssw0rd'),
        ]);

        \App\Models\Event::factory(20)->create();
        \App\Models\News::factory(20)->create();
    }
}
