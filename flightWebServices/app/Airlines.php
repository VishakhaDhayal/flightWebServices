<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Airlines extends Model
{
    public function flights(){
      return $this->hasMany('App\Flights');
    }
}
