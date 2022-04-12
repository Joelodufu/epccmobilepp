import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/misc/colors.dart';
import 'package:flutter_app/widgets/app_text.dart';
import 'package:flutter_app/widgets/know_your_pastors.dart';
import 'package:flutter_app/widgets/paragraph.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
        var requiredAspect =MediaQuery.of(context).size.width > MediaQuery.of(context).size.height? 1: MediaQuery.of(context).size.width / 540;

    if (MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height) {
      return Scaffold(
        body: Container(),
      );
    } else {
      return Scaffold(
        
          appBar: AppBar(
            leading: Image.asset(
              "img/logo.png",
            ),
            backgroundColor: AppColors.mainColor,
            title: Text("The EPCC Inc."),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Container(
                      width: double.maxFinite,
                      height: 70,
                      
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30), 
                        bottomRight: Radius.circular(30))
                      ),
                      child: Center(
                        child: AppText(
                          text: "Welcome Home!!!",
                          size:  25,
                          color: Colors.white,
                        ),
                      ),
                    ),
               
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Center(
                    child: AppText(
                      text: "ANNOUNCEMENT",
                      color: Color.fromARGB(255, 131, 0, 0),
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  color: Colors.white,
                  height: 70,
                  padding: EdgeInsets.only(left: 16),
                  child: Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Easther Retreat is coming up, the venue will be the Anmoda Main Santuary of Praise ',
                          textStyle: TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 26, 50, 85),
                              fontStyle: FontStyle.italic),
                          speed: const Duration(milliseconds: 100),
                        ),
                        TypewriterAnimatedText(
                          'Remember to Pray for the upcomming program, Let The Acts of God be made manifest',
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 26, 50, 85),
                              fontStyle: FontStyle.italic),
                          speed: const Duration(milliseconds: 100),
                        ),
                        TypewriterAnimatedText(
                          'The pulpit exchange that is sheduled for Jamuary have been postponed for next year',
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 26, 50, 85),
                              fontStyle: FontStyle.italic),
                          speed: const Duration(milliseconds: 100),
                        ),
                        WavyAnimatedText(
                          'The Daily Devotionals is ready, get one to join the pulpit at home program',
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 26, 50, 85),
                              fontStyle: FontStyle.italic),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 10,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    color: Colors.white,
                    width: 520,
                    height: 600,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                          text: "🔥🔥DAILY FUEL FOR DAILY FIRE🔥🔥",
                          color: Colors.black54,
                          size: 30,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        AppText(
                          text: "Make Prayer a Lifestyle",
                          color: Color.fromARGB(255, 32, 0, 107),
                          size: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          child: Paragraph(
                            text:
                                "In the same way, prayer is essential in this ongoing warfare, Pray Hard and Long. Pray for your brothers and sisters, Keep your eyes open, Keep each other's spirit up so that no one falls behind or drops out",
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 25,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            child: AppText(
                          text: "Ephesians 6:18",
                          color: Colors.red,
                          size: 30,
                        )),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          child: AppText(
                            text:
                                "The reason for prayer is not to convince God that you are really serious about your objective of praying. Rather, it is about what spending time in fellowship with him does in your spirit",
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 25,
                            style: FontStyle.italic,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            child: AppText(
                          text: "PRAYER",
                          color: Colors.red,
                          size: 25,
                        )),
                        Expanded(
                          child: Center(
                            child: Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: AppText(
                                  text:
                                      'Dear Father, Thank you for the privilege of fellowship with you through the spirit of prayer',
                                  size: 30,
                                  color: Color.fromARGB(255, 0, 112, 143),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: AppText(
                  text: "Know Your Pastors",
                  size: 35,
                  color: Color.fromARGB(255, 169, 126, 0),
                )),
                Container(
                  height: 100,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Positioned(
                        child: Container(
                          width: double.maxFinite,
                          height: 50,
                          color: Colors.black,
                        ),
                      ),
                      Positioned(child: KnowYourPastors()),
                    ],
                  ),
                )
              ],
            ),
          ));
    }
  }
}
