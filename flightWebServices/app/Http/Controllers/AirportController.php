<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Airport;
use App\Flights;

class AirportController extends Controller
{
    public function index(){
      return Airport::all();
    }

  
}
