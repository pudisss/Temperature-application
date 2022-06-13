import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter/cupertino.dart";
import "../backend/data/data.dart";

class ImageSelector extends StatefulWidget {
  ImageSelector({Key? key}) : super(key: key);

  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  @override
  Widget build(BuildContext context) {
    return cloudtype == "overcast clouds" ? Container(
      margin: EdgeInsets.only(top: 50),
      child: Image.asset('assets/images/cloudy.png')
    ) : Container(
      margin: EdgeInsets.only(top: 50),
      child: Image.asset('assets/images/sunny.png')
    );
  }
}