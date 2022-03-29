import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/app_large_text.dart';
import 'package:flutter_app/widgets/app_text.dart';
import 'package:flutter_app/widgets/paragraph.dart';
import 'package:flutter_app/widgets/responsive_button.dart';

import '../misc/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  List images =[
    "welcome-one.png",
    "welcome-one.png",
    "welcome-one.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (_, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              
              image: DecorationImage(
                image: AssetImage(
                  "img/"+images[index]
                )
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Row(

                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: List.generate(3, (indexDots)=>Container(
                         width: index==indexDots?50:8,
                         height: 8,
                         margin: EdgeInsets.only(right: 10),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8),
                           color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)
                         ),
                       ))
                     ),
                      SizedBox(height: 20,),
                      AppLargeText(text: "Devotional"),
                      AppText(text: "Mountain", size: 30,),
                      SizedBox(height: 20,),
                      Container(
                        width: 250,
                        child: AppText(
                          text: "Joellee is a great food eater but when he saw that there is more to life than just nurishing the organs of the body, he decide to check out the ",
                          color: AppColors.textColor2,
                          size: 20,
                        ),

                      ),
                      SizedBox(height: 40,),
                      ResponsiveButton(width: 200,)
                    ],
                  )

                ],
              ),
            ),
          );
      }),
    );
  }
}
