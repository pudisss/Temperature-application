import 'dart:ui';

import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter/cupertino.dart";
import "package:animations/animations.dart";
import "../backend/api/api.dart";
import "../backend/data/data.dart";
import "package:geolocator/geolocator.dart";
import "dart:io" show Platform;
import "../components/imageselector.dart";
import "package:weather/weather.dart";
import "../pages/forcastreport.dart";
import "../pages/nextforcast.dart";



class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Essential variable

  // Current time
  // Get weather api
  
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
   
    if (cloudtype != Null) {
      setState(() {
        
      });
    }
   
    
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: getWeather,

        child: FutureBuilder(
        future: getWeather(),
        builder: (context,  AsyncSnapshot snapshot) {
          print(cloudtype);
          return snapshot.connectionState == ConnectionState.done ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage("assets/images/homebackground.png")
              ),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(71, 191, 223, 1),
                  Color.fromRGBO(74, 145, 255, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60, left: 20),
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset('assets/images/location.png')
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(areaNames ?? "Something", style: TextStyle(fontFamily: "Overpass", fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white))
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Image.asset('assets/images/pointer.png')
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Image.asset('assets/images/notification.png')
                      )
                    ]
                  )
                ),
                // The wind image widget
                ImageSelector(),

                // Weather information
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NextForcast()));
                  },
                  child: Container(
                    width: 353,
                    height: 335,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Color.fromRGBO(210, 210, 210, 1))
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Today, ",
                                  style: TextStyle(fontFamily: "Overpass", fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white, shadows: [
                                   
                                  ]),
                                  
                                ),
                                TextSpan(
                                  text: "${now.day} ${days[now.month - 1]}",
                                  style: TextStyle(fontFamily: "Overpass", fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,)
                
                                )
                              ]
                            )
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Text("${temperature.toString().substring(0, 4)} °", style: TextStyle(fontFamily: "Overpass", fontSize: 100, fontWeight: FontWeight.w400, color: Colors.white))),
                        Container(
                          child: Text(cloudtype ?? "No cloud type yet", style: TextStyle(fontFamily: "Overpass", fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white))
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Image.asset('assets/images/windy.png')
                                    ),
                                    Container(
                                      child: Text("Wind", style: TextStyle(fontFamily: "Overpass", fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white))
                                    ),
                                    Container(
                                      child: Image.asset('assets/images/divider.png')
                                    ),
                                    Container(
                                      child: Text("${windSpeed}m/s", style: TextStyle(fontFamily: "Overpass", fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,))
                                    )
                
                                  ]
                                )
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Image.asset('assets/images/hum.png'),
                                    ),
                                    Container(
                                      child: Text("Hum", style: TextStyle(fontFamily: "Overpass", fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white))
                                    ),
                                    Container(
                                      child: Image.asset('assets/images/divider.png')
                                    ),
                                    Container(
                                      child: Text("${humitidy} %", style: TextStyle(fontFamily: "Overpass", fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,))
                                    )
                                  ]
                                )
                              )
                            ]
                          )
                        )
                      
                
                      ]
                    )
                  ),
                ),
                // Button to weather forecast
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top:1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ForcastReport()));
                          },
                          child: Container(
                            width: 150,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text("Forcast Report",style: TextStyle(fontFamily:"Overpass", fontSize: 18, fontWeight: FontWeight.w400, color: Color.fromRGBO(68, 78, 114, 1)))
                                ),
                                Container(
                                  child: Image.asset('assets/images/upperarrow.png')
                                )
                              ]
                            )

                          )
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              
                            });
                          },
                          child: Container(
                            width: 150,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(child: Text("Refresh page", style: TextStyle(fontFamily: "Overpass", fontSize: 18, fontWeight: FontWeight.w400, color: Color.fromRGBO(68, 78, 114, 1))))

                          )
                        )
                      ),
                      

                    ],
                  ),
                )

                
                
              ]
            )
           
          ) : Platform.isAndroid ? Center(child: CircularProgressIndicator()) : Center(child: CupertinoActivityIndicator(
            radius: 15,
          ));
        }
      )
    ));
  }
}