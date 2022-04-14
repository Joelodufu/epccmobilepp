import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/app_text.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isIcon;

  AppButtons(
      {Key? key,
      this.isIcon = false,
      this.text = "hi",
      this.icon,
      required this.color,
      required this.backgroundColor,
      required this.size,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
var requiredAspect =MediaQuery.of(context).textScaleFactor > MediaQuery.of(context).textScaleFactor? 1: MediaQuery.of(context).textScaleFactor;    
        var requiredPadding =MediaQuery.of(context).padding.top ;
        var requiredWidth =MediaQuery.of(context).size.width -requiredPadding;
        var requiredHeight =MediaQuery.of(context).size.height > MediaQuery.of(context).size.height? 1: MediaQuery.of(context).size.height/548;

    return Container(
      width: requiredWidth/10,
      height:  requiredWidth/10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(requiredAspect*15),
          color: backgroundColor,
          border: Border.all(color: borderColor, width:requiredAspect* 1.0)),
      child: isIcon == false
          ? Center(
              child: AppText(
              text: text!,
              color: color,
              size:25
            ))
          : Center(
              child: Icon(
              icon,
              color: color,
            )),
    );
  }
}
