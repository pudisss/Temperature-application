import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter/cupertino.dart";

class ListViewImageSelector extends StatefulWidget {
  final String cloudtype;
  ListViewImageSelector(this.cloudtype);

  @override
  State<ListViewImageSelector> createState() => _ListViewImageSelectorState(this.cloudtype);
}

class _ListViewImageSelectorState extends State<ListViewImageSelector> {
  final String cloudtype;
 _ListViewImageSelectorState(this.cloudtype);
  @override
  Widget build(BuildContext context) {
    return (cloudtype == "overcast clouds") ? Container(
      width: 43,
      height: 43,
      child: Image.asset('assets/images/cloudy.png'),
    ) : Container(
      width: 43,
      height: 43,
      child: Image.asset('assets/images/sunny.png')
    );
  }
}