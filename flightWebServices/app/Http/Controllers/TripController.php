<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Trips;
use App\Airport;
use Carbon\Carbon;

class TripController extends Controller
{
    public function showTrips(Request $request){
      $combinedTrip = array();
      $departureAirport  =  Airport::where('city','=',$request->departure_city)->pluck('id');
      $arrivalAirport    =  Airport::where('city','=',$request->arrival_city)->pluck('id');
      $departureTimezone =  Airport::where('city','=',$request->departure_city)->pluck('timezone');
      $arrivalTimezone   =  Airport::where('city','=',$request->arrival_city)->pluck('timezone');
      $trips             =  Trips::with(['flight','flight.airlines','departureAirports','arrivalAirports'])
                            ->where('departure_airport_id','=',$departureAirport)
                            ->where('arrival_airport_id','=',$arrivalAirport)
                            ->whereDate('departure_date_time',$request->trip_date)->paginate(10);
      $tripArray        =  array('first_trip'=>$this->filterFlightData($trips));

      if(isset($request->return_date) && !empty($request->return_date)){
        $returnTrip       =  Trips::with(['flight','flight.airlines','departureAirports','arrivalAirports'])
                              ->where('departure_airport_id','=',$arrivalAirport)
                              ->where('arrival_airport_id','=',$departureAirport)
                              ->whereDate('departure_date_time',$request->return_date)->paginate(10);
        $tripArray['return_trip']=$this->filterFlightData($returnTrip);
      }
        return $tripArray;
    }

    public function filterFlightData($data){
        $iloop = 0;
        foreach ($data as $value) {
          $convertedDepartureDate = Carbon::createFromFormat('Y-m-d H:i:s', $value->departure_date_time,'UTC' );
          $convertedDepartureDate->setTimezone($value->departureAirports->timezone);
          $convertedArrivalDate = Carbon::createFromFormat('Y-m-d H:i:s', $value->arrival_date_time,'UTC' );
          $convertedArrivalDate->setTimezone($value->departureAirports->timezone);
          $totalDuration = $convertedDepartureDate->diffInHours($convertedArrivalDate)." hours";


          $tripArray[$iloop]['departure_timezone']    =   $value->departureAirports->timezone;
          $tripArray[$iloop]['departure_date']        =   date('d-m-Y',strtotime($convertedDepartureDate));
          $tripArray[$iloop]['departure_time']        =   date('H:i',strtotime($convertedDepartureDate));
          $tripArray[$iloop]['arrival_date']          =   date('d-m-Y',strtotime($convertedArrivalDate));
          $tripArray[$iloop]['arrival_time']          =   date('H:i',strtotime($convertedArrivalDate));
          $tripArray[$iloop]['price']                 =   $value->price;
          $tripArray[$iloop]['flight_duration']       =   $totalDuration;
          $tripArray[$iloop]['flight_number']         =   $value->flight->flight_number;
          $tripArray[$iloop]['airlines']              =   $value->flight->airlines->name ;
          $tripArray[$iloop]['departure_airport']     =   $value->departureAirports->name;
          $tripArray[$iloop]['departure_city']        =   $value->departureAirports->city;
          $tripArray[$iloop]['arrival_airport']       =   $value->arrivalAirports->name;
          $tripArray[$iloop]['departure_airport']     =   $value->arrivalAirports->city;
          $iloop++;
        }
        $resultArray['data']          = $tripArray;
        $resultArray['total_flights'] = $data->total();
        return $resultArray;
    }
}
