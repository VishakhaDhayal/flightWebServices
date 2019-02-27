<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flights extends Model
{
    public function airlines(){
      return $this->belongsTo('App\Airlines','airline_id');
    }
    public function trips(){
      return $this->has('App\Trips');
    }
}
