<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Airport;
use App\Airlines;
use App\Flights;

class FlightController extends Controller
{
  public function showFlights(Request $request){
    $flights = Flights::with(['airlines','departureAirports','arrivalAirports'])->get();
    return $flights;
    // $departureAirport =  $request->departureAirport;
    // $arrivalAirport   =  $request->arrivalAirport;
    // $depatureObj      =  Airport::where('code','=',$departureAirport)->first();
    // $arrivalObj       =  Airport::where('code','=',$arrivalAirport)->first();
    // // $availableFlights =  Flights::where('departure_airport_id','=',$depatureObj->id)
    // //                     ->where('arrival_airport_id','=',$arrivalObj->id)->get();
    // $availableFlights =  DB::table('flights')->leftJoin('airlines', 'airline_id', '=', 'airlines.id')->where('departure_airport_id','=',$depatureObj->id)
    //                     ->where('arrival_airport_id','=',$arrivalObj->id)->get();
    return $availableFlights;
  }
}
