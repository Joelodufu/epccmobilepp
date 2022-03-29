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
    var requiredAspectRario = MediaQuery.of(context).size.width/540;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(requiredAspectRario*15),
          color: backgroundColor,
          border: Border.all(color: borderColor, width:requiredAspectRario* 1.0)),
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
