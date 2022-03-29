import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final FontStyle style;
  AppText({Key? key,
    this.style=FontStyle.normal,
    this.size=16,
    required this.text,
    this.color=Colors.black54}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var requiredAspectRario = MediaQuery.of(context).size.width/540;

    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize:requiredAspectRario*size,
          fontStyle: style
      ),
    );
  }
}
