import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter/cupertino.dart";
import "package:geocoding/geocoding.dart";
import "package:geolocator/geolocator.dart";


// This file will store all data that will be used globally in this folder

// Api data 

// Latitude and lontitude

dynamic lati;
dynamic lonti;


// Place data

dynamic areaNames;
dynamic country;
dynamic cloudtype;
dynamic temperature;
dynamic windSpeed;
dynamic humitidy;


// Day data

List<String> days = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",

];



// Five forcast weather



List<dynamic> fivedemp = [];
List<dynamic> fiveday = [];
List<dynamic> fivecloudtype = [];
