import "package:http/http.dart" as http;
import "dart:convert";

import "../data/data.dart";
import "package:geolocator/geolocator.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter/cupertino.dart";
import "package:weather/weather.dart";



// This block of code will request data from the api that we picked and will stored data to the data.dart file


// Read data from the weather api





Future<Weather> getWeather() async{
  
  

  String apikey = "d102ec48c50c23f6764aab1d2f208a2b";

  // Declaration of position
  
  WeatherFactory weather =  new WeatherFactory(apikey); // Declaring a new object
  Weather w = await weather.currentWeatherByLocation(lati, lonti);

  areaNames = w.areaName ?? "No areaname";
  country = w.country ?? "No country";
  temperature = w.tempMax ?? "Null";
  cloudtype = w.weatherDescription ?? "No Description";
  windSpeed = w.windSpeed ?? "No wind speed yet";
  humitidy = w.humidity ?? "No humidity";
  return w;




}

Future getForcast() async {
    String apikey = "d102ec48c50c23f6764aab1d2f208a2b";

    WeatherFactory weather = new WeatherFactory(apikey);
    List<Weather> w = await  weather.fiveDayForecastByLocation(lati, lonti);

    for (var i in w) {
      fivedemp.add(i.temperature?.celsius);
      
      fivecloudtype.add(i.weatherDescription);
      fiveday.add(i.date);
     

     
    }
    return w; 



}