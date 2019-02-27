<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAirportsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('airports', function (Blueprint $table) {
            $table->increments('id');
            $table->string('code');
            $table->string('city_code');
            $table->string('city');
            $table->string('country_code');
            $table->string('region_code');
            $table->decimal('lattitude',10,8);
            $table->decimal('longitude',11,8);
            $table->string('timezone');
            $table->string('name');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('airports');
    }
}
