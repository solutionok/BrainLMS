<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(RolesSeeder::class);
        // $this->call(LanguagesSeeder::class);
        // $this->call(SettingSeeder::class);
        // $this->call(MailAndSMSTemplatesSeeder::class);
        $this->call(InitSeeder::class);
    }
}
