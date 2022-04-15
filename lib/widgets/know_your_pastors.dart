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
      "name":"Pst. Abutu",
      "image":"img/abutu.png"
    },
    {
      "name":"Pst. Sam",
      "image":"img/samomale.png"
    },
    {
      "name":"Pst. Anebi",
      "image":"img/anebi.png"
    },
    {
      "name":"Pst. Otene",
      "image":"img/otene.png"
    },
    {
      "name":"Pst. Abel",
      "image":"img/abelugana.png"
    },
    {
      "name":"Pst. Ken",
      "image":"img/ken.png"
    },
    
    {
      "name":"Pst. Mattew",
      "image":"img/mattew.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
      var requiredAspect =MediaQuery.of(context).textScaleFactor > MediaQuery.of(context).textScaleFactor? 1: MediaQuery.of(context).textScaleFactor;
        
        var requiredPadding =MediaQuery.of(context).padding.top ;
        var requiredWidth =MediaQuery.of(context).size.width -requiredPadding;
        var requiredHeight =MediaQuery.of(context).size.height > MediaQuery.of(context).size.height? 1: MediaQuery.of(context).size.height/548;

    return Container(
      padding: EdgeInsets.only(
          top:10, bottom:  10),
      height: 300,
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
              height: requiredHeight* 30,
              width:100,
              decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(pastors[index]["image"]),
                          fit: BoxFit.fitHeight),
                    ),
              margin: EdgeInsets.only(left: requiredAspect * 20),
              child: Container(
                  height: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                  margin: EdgeInsets.only(top:  requiredWidth* 50),
                  child: Column(children: [
                    AppText(
                      text: pastors[index]["name"],
                      size:  20,
                      color: Colors.black,
                    )
                  ])),
            );
          }),
    );
  }
}
