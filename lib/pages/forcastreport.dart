import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/widgets.dart";


class ForcastReport extends StatefulWidget {
  ForcastReport({Key? key}) : super(key: key);

  @override
  State<ForcastReport> createState() => _ForcastReportState();
}

class _ForcastReportState extends State<ForcastReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 60, left: 20),
                child: Text("Your notification", style: TextStyle(fontFamily: "Overpass", fontSize: 24, fontWeight: FontWeight.w900, color: Color.fromRGBO(68, 78, 114, 1)))
              ),
            )
          ]
        )
      )
    );
  }
}