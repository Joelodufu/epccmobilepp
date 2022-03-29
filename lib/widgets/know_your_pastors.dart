import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/misc/colors.dart';

import 'app_text.dart';

class KnowYourPastors extends StatelessWidget {
   KnowYourPastors({Key? key}) : super(key: key);

  List pastors = [
    {
      "name":"Pst. Ben",
      "image":"img/onomike.png"
    },
    {
      "name":"Pst. Sam",
      "image":"img/samomale.png"
    },
    {
      "name":"Pst. Abel",
      "image":"img/abelugana.png"
    },
    {
      "name":"Pst. Philips",
      "image":"img/philips.png"
    },
    {
      "name":"Pst. Emma",
      "image":"img/joelodufu.png"
    },
    {
      "name":"Pst. Ben",
      "image":"img/onomike.png"
    },
    {
      "name":"Pst. Ben",
      "image":"img/onomike.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var requiredAspect = MediaQuery.of(context).size.width / 540;
    return Container(
      padding: EdgeInsets.only(
          top: requiredAspect * 10, bottom: requiredAspect * 10),
      height: requiredAspect * 120,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
      ),
      margin: const EdgeInsets.only(left: 0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: pastors.length,
          itemBuilder: (_, index) {
            return Container(
              height:  10,
              width:  100,
              decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(pastors[index]["image"]),
                          fit: BoxFit.fitHeight),
                    ),
              margin: EdgeInsets.only(left: requiredAspect * 20),
              child: Container(
                  height: 50,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: requiredAspect * 70),
                  child: Column(children: [
                    AppText(
                      text: pastors[index]["name"],
                      size: requiredAspect * 20,
                      color: Colors.black,
                    )
                  ])),
            );
          }),
    );
  }
}
