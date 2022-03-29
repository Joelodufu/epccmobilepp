import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/misc/colors.dart';
import 'package:flutter_app/models/bible_study_model.dart';
import 'package:flutter_app/widgets/app_buttons.dart';
import 'package:flutter_app/widgets/app_large_text.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_app/widgets/responsive_button.dart';

import '../pages/bible_study_page.dart';
import '../widgets/app_text.dart';
import '../widgets/profile.dart';

class BibbleStudyPage extends StatefulWidget {
  BibbleStudyPage({Key? key}) : super(key: key);

  @override
  State<BibbleStudyPage> createState() => _BibbleStudyPageState();
}

class _BibbleStudyPageState extends State<BibbleStudyPage> {
  int bibleStudyIndex = 0;
  @override
  Widget build(BuildContext context) {
    var requiredAspect =MediaQuery.of(context).size.width > MediaQuery.of(context).size.height? 1: MediaQuery.of(context).size.width / 540;

    return Scaffold(
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text("${data.error}"),
            );
          } else if (data.hasData) {
            return Scaffold(
              appBar: AppBar(
            leading: Image.asset(
              "img/logo.png",
            ),
            backgroundColor: AppColors.mainColor,
            title: Text("The EPCC Inc."),
            centerTitle: true,
          ),
              body: Container(
                width: double.maxFinite,
                height: requiredAspect * 1050,
                color: Color.fromARGB(255, 208, 208, 208),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: requiredAspect * 70,
                      
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30), 
                        bottomRight: Radius.circular(30))
                      ),
                      child: Center(
                        child: AppText(
                          text: "EPCC Bible Study",
                          size:  25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: requiredAspect * 20, top: requiredAspect * 20),
                      child: Row(
                        children: [
                          AppText(
                            text: " Bible Study",
                            size:  20,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Container(
                            child: Icon(
                              Icons.play_arrow,
                              size: requiredAspect * 15,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: requiredAspect * 10,
                            right: requiredAspect * 10),
                        margin: EdgeInsets.only(
                            left: requiredAspect * 10,
                            right: requiredAspect * 10),
                        child: ListView.builder(
                          controller: ScrollController(
                              // or whatever offset you wish
                              ),
                          itemBuilder: (context, index) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  child: GestureDetector(
                                    onTap: () {
                                      bibleStudyIndex = index;
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BibleStudyPage(bbIndex:bibleStudyIndex) ));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      margin: EdgeInsets.only(
                                          bottom: requiredAspect * 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: requiredAspect * 50,
                                            width: requiredAspect * 250,
                                            margin: EdgeInsets.only(
                                                top: requiredAspect * 5,
                                                bottom: requiredAspect * 5),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AppButtons(
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 16, 4, 124),
                                                  size: requiredAspect * 50,
                                                  borderColor: Color.fromARGB(
                                                      255, 33, 0, 99),
                                                  text: (bibleStudyList.indexOf(
                                                              bibleStudyList[
                                                                  index]) +
                                                          1)
                                                      .toString(),
                                                ),
                                                AppText(
                                                  text: bibleStudyList[index].date,
                                                  size: requiredAspect * 40,
                                                  color: Color.fromARGB(
                                                      255, 95, 95, 95),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            color: Colors.white,
                                            width: double.maxFinite,
                                            child: Row(
                                              crossAxisAlignment:CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: requiredAspect * 350,
                                                  child: AppText(
                                                    text: bibleStudyList[index].topic,
                                                    size: requiredAspect * 45,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                              width: requiredAspect * 400,
                                              child: AppText(
                                                text: bibleStudyList[index]
                                                    .contents[1]["content"],
                                                size: requiredAspect * 30,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                          itemCount: bibleStudyList.length,
                        ),
                      ),
                    ),
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
