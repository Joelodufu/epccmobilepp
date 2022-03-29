import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  final String text;
  double size;
  final Color color;
   Paragraph({ Key? key,
    this.size = 10,
    this.color=Colors.black87, required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var requiredAspectRario = MediaQuery.of(context).size.width/540;

    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: requiredAspectRario*size
      ),
    );
  }
}
