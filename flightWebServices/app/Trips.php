<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Trips extends Model
{
  public function departureAirports(){
    return $this->belongsTo('App\Airport','departure_airport_id');
  }
  public function arrivalAirports(){
    return $this->belongsTo('App\Airport','arrival_airport_id');
  }
  public function flight(){
    return $this->belongsTo('App\Flights','flight_id');
  }
}
