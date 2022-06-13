import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/widgets.dart";
import "../backend/data/data.dart";
import "../backend/api/api.dart";
import "dart:io" show Platform;
import "dart:developer";
import "package:weather/weather.dart";
import "../components/listviewimageselector.dart";

class NextForcast extends StatefulWidget {
  NextForcast({Key? key}) : super(key: key);

  @override
  State<NextForcast> createState() => _NextForcastState();
}

class _NextForcastState extends State<NextForcast> {

  // Five day forcast read data function
  

  // Time variable
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getForcast(),
        builder:(context, AsyncSnapshot snapshot) {
          
         print(fiveday);
         print(fivecloudtype);
         print(fivedemp);
          return snapshot.connectionState == ConnectionState.done ?  Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(71, 191, 223, 1),
                Color.fromRGBO(74, 145, 255, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage("assets/images/homebackground.png")
            )
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              child: Icon(Icons.arrow_back_ios, color: Colors.white)
                            ),
                            Container(
                              child: Text("Back", style: TextStyle(fontFamily: "Overpass", fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white,))
                            )
                          ]
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Image.asset('assets/images/setting.png')
                    )
                  ]
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 80, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Today", style: TextStyle(fontFamily: "Overpass", fontSize: 24, fontWeight: FontWeight.w900, color:Colors.white,))
      
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text("${days[now.month - 1]}, ${now.day}", style: TextStyle(fontFamily: "Overpass", fontSize: 18, fontWeight: FontWeight.w400, color:Colors.white,))
                    )
                  ]
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(5, (index) {
                      return Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Container(
                              child: Text("${fivedemp[index].toString().substring(0, 4)}°C", style: TextStyle(fontFamily: "Overpass", fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,))
                            ),
                            ListViewImageSelector(fivecloudtype[index]),
                            Container(
                              child: Text("${fiveday[index].hour.toString()}.${fiveday[index].minute.toString()}", style: TextStyle(fontFamily: "Overpass", fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,))
                            )

                          ]
                        )
                      );
                    })
                  )
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Next Forecast", style: TextStyle(fontFamily: "Overpass", fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white,))
                    ),
                    Container(
                      child: Image.asset('assets/images/calendar.png')
                    )
                  ]
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: List.generate(5, (index) {
                      return Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Text("${days[now.month]}, ${fiveday[index].day}", style: TextStyle(fontFamily: "Overpass", fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white,))
                          ),
                          ListViewImageSelector(
                            fivecloudtype[index]
                          ),
                          Container(
                            child: Text("${fivedemp[index].toString().substring(0, 4)}°C", style: TextStyle(fontFamily: "Overpass", fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white,))
                          ),
                        ]
                      ));
                    })
                  )
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset('assets/images/sun.png')
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text("LahtiWeather", style: TextStyle(fontFamily: "Overpass", fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white,))
                    )
                  ]
                )
              )
              
              
              
            ]
          )
        ) : Platform.isAndroid ? Center(child: CircularProgressIndicator()) : Center(child: CupertinoActivityIndicator(radius: 15));}
  )
    );
  }
}