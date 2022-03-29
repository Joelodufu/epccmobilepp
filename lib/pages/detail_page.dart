import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/misc/colors.dart';
import 'package:flutter_app/widgets/app_buttons.dart';
import 'package:flutter_app/widgets/app_large_text.dart';
import 'package:flutter_app/widgets/app_text.dart';
import 'package:flutter_app/widgets/profile.dart';
import 'package:flutter_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 2;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var requiredAspectRario = MediaQuery.of(context).size.width/540;

    if (MediaQuery.of(context).size.width>MediaQuery.of(context).size.height){
      return const Scaffold(
        body: Text("hello to the world"),
      );
    }else{
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: requiredAspectRario*400,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("img/logo.jpg"),
                          fit: BoxFit.cover),
                    ),
                  )),
              Positioned(
                  left: requiredAspectRario*20,
                  top:requiredAspectRario* 60,
                  right: requiredAspectRario*30,
                  child: Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                        ),
                        Profile()

                      ],
                    ),
                  )),
              Positioned(
                  top: requiredAspectRario*320,
                  child: Container(
                    padding:  EdgeInsets.only(left:requiredAspectRario* requiredAspectRario*20, right:requiredAspectRario* 20, top:requiredAspectRario* 30),
                    width: MediaQuery.of(context).size.width,
                    height: requiredAspectRario*500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(requiredAspectRario*30),
                            topRight: Radius.circular(requiredAspectRario*30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: "Reality of Hope",
                              color: Colors.black.withOpacity(0.8),

                            ),
                            AppLargeText(
                              text: "\$5645",
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: requiredAspectRario*10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(
                              height: requiredAspectRario*5,
                            ),
                            AppText(
                                text: "Otukpo Central",
                                color: AppColors.textColor1)
                          ],
                        ),
                        SizedBox(
                          height: requiredAspectRario*20,
                        ),
                        Row(children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < gottenStars
                                    ? AppColors.starColor
                                    : AppColors.textColor2,
                              );
                            }),
                          ),
                          SizedBox(
                            height: requiredAspectRario*10,
                          ),
                          AppText(
                            text: "$gottenStars",
                            color: AppColors.textColor2,
                          )
                        ]),
                        SizedBox(
                          height:requiredAspectRario* 20,
                        ),
                        AppLargeText(
                          text: "Comments",
                          color: Colors.black.withOpacity(.8),
                          size: 20,
                        ),
                        AppText(
                          text: "Number of People in the group",
                          color: AppColors.mainTextColor,
                        ),
                        SizedBox(
                          height:requiredAspectRario* 10,
                        ),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin:  EdgeInsets.only(right: requiredAspectRario*15),
                                child: AppButtons(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey.withOpacity(.3),
                                  size: requiredAspectRario*50,
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : Colors.white,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          height:requiredAspectRario* 10,
                        ),
                        AppLargeText(text: "Description", color: Colors.black.withOpacity(.8),size: requiredAspectRario*20,),
                        SizedBox(
                          height: requiredAspectRario*10,
                        ),
                        AppText(text: "When the word breaks you and all you is all god left in you and left you to be the one and only thing you would ever be aware you did greate during enternity is to chose the way of the lord", color: AppColors.mainTextColor,),

                      ],
                    ),
                  )),
              Positioned(
                  bottom:requiredAspectRario* 20,
                  left: requiredAspectRario*20,
                  right:requiredAspectRario* 20,
                  child: Row(
                    children: [
                      AppButtons(
                        color: AppColors.textColor1,
                        backgroundColor:
                        Colors.white,
                        size: requiredAspectRario*60,
                        borderColor: AppColors.textColor1,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(width: requiredAspectRario*20,),
                      ResponsiveButton(
                        isResponsive: true,
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    }


  }
}
