import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/misc/colors.dart';
import 'package:flutter_app/models/bible_study_model.dart';
import 'package:flutter_app/widgets/app_buttons.dart';
import 'package:flutter_app/widgets/app_large_text.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'package:flutter_app/widgets/app_text.dart';
import 'package:flutter_app/widgets/paragraph.dart';
import 'package:flutter_app/widgets/responsive_button.dart';
import '../widgets/profile.dart';

class BibleStudyPage extends StatefulWidget {
  int bbIndex;
  BibleStudyPage({required this.bbIndex});

  @override
  State<BibleStudyPage> createState() => _BibleStudyPageState(bbIndex);
}

class _BibleStudyPageState extends State<BibleStudyPage> {
  int bbIndex;
  _BibleStudyPageState(this.bbIndex);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var requiredAspect =
        MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
            ? 1
            : MediaQuery.of(context).size.width / 540;

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "img/logo.png",
        ),
        backgroundColor: AppColors.mainColor,
        title: Text("The EPCC Inc."),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text("${data.error}"),
            );
          } else if (data.hasData) {
            return Scaffold(
              body: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                color: Color.fromARGB(255, 235, 235, 235),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: requiredAspect * 70,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Center(
                        child: AppText(
                          text: " 🎡${bibleStudyList[bbIndex].theme}🎡",
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppText(
                            text: " Bible Study",
                            size: 25,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Container(
                            child: Icon(
                              Icons.play_arrow,
                              size: 17,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          AppText(
                            text: bibleStudyList[bbIndex].date,
                            size: 25,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppLargeText(
                            text: bibleStudyList[bbIndex].topic,
                            color: Color.fromARGB(255, 0, 8, 116),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                         
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        height: size.height * 0.8,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: ListView.builder(
                          controller: ScrollController(
                              // or whatever offset you wish
                              ),
                          itemBuilder: (context, index) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.maxFinite,
                                        child: AppText(
                                          text: bibleStudyList[bbIndex]
                                              .contents[index]["head"],
                                          color: Colors.red,
                                          size: 25,
                                        ),
                                      ),
                                      Container(
                                        child: Paragraph(
                                          text: bibleStudyList[bbIndex]
                                              .contents[index]["content"],
                                          size: 25,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                          itemCount: bibleStudyList[bbIndex].contents.length,
                        ),
                      ),
                    ),
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            offset: Offset(0, -5),
                            spreadRadius: 0,
                            color: AppColors.mainColor.withOpacity(0.2),
                            blurRadius: 10)
                      ]),
                      height: 50,
                      width: double.maxFinite,
                      child: IconButton(
                        icon: Icon(
                          Icons.back_hand,
                          color: AppColors.mainColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  late List<dynamic> bibleStudyList;

  Future<List<BibleStudyModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString("jasonfiles/biblestudy.json");
    final list = json.decode(jsondata) as List<dynamic>;
    var data = list.map((e) => BibleStudyModel.fromJson(e)).toList();
    setState(() {
      bibleStudyList = data;
    });
    return data;
  }
}
