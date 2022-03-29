// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/bible_data_model.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_app/widgets/app_text.dart';
import 'package:flutter_app/widgets/bible_study_content.dart';
import 'dart:developer';

import 'package:flutter_app/widgets/paragraph.dart';

import '../misc/colors.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  var dropDownBook = "Genesis";
  var dropDownChapter = "1";
  var chapterIndex = 0;
  var bookIndex = 0;
  List chapterList = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    '24',
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50"
  ];

  var dropDownVerse = "1";
  var verseIndex = 0;
  List<String> versesIndexLists = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];

//Reset Previoous Input on book selection

//GET THE INDEX OF THE book SELECTED
  int getBookIndex(String book, List bible) {
    var bookIndex = 1;
    for (var i = 0; i < bible.length; i++) {
      if (bible[i].book.toString() == book) {
        bookIndex = bible.indexOf(bible[i]);
        return bookIndex;
      }
    }
    return bookIndex;
  }

//GET CHAPTER LIST PORPULETED
  List porpulatChapterList(int bookIndex, List bible) {
    var chapterList = [];
    var chapter = 0;
    for (var i = 0; i < bible[bookIndex].chapters.length; i++) {
      chapter += 1;
      chapterList.add(chapter);
    }
    return chapterList;
  }

//GET THE INDEX OF THE CHAPTER SELECTED

  int getChapterIndex(String chapter) {
    var chapterIndex = int.parse(chapter) - 1;
    return chapterIndex;
  }

//GET VERSES
  List<String> porpulateVerseList(
    int chapterIndex,
    int bookIndex,
    List bible,
  ) {
    List<String> verseIndexLists = [];
    var verse = 0;
    for (var i = 0; i < bible[bookIndex].chapters[chapterIndex].length; i++) {
      var newIndex = (verse += 1).toString();
      verseIndexLists.add(newIndex);
    }
    return verseIndexLists;
  }

  int getVerseIndex(String chapter) {
    var chapterIndex = int.parse(chapter) - 1;
    return chapterIndex;
  }

  Future scrollToVerse(verse) async {
    await Scrollable.ensureVisible(verse);
  }

  @override
  Widget build(BuildContext context) {
    var requiredAspect = MediaQuery.of(context).size.width / 540;
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
            return Container(
                width: double.maxFinite,
                height: 900,
                color: Colors.blueGrey.withOpacity(.1),
                child: Column(children: [
                 
                  Container(
                    color: Colors.white,
                    child: Container(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //BOOK SELECTION DROPDOWN
                          //======================================
                          DropdownButton(
                            // Initial Value
                            value: dropDownBook,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: bibleList.map((e) {
                              return DropdownMenuItem(
                                value: e.book.toString(),
                                child: Text(e.book.toString()),
                              );
                            }).toList(),

                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropDownBook = newValue!;
                                bookIndex = getBookIndex(newValue, bibleList);
                                chapterList =
                                    porpulatChapterList(bookIndex, bibleList);
                              });
                            },
                            onTap: () {
                              setState(() {
                                dropDownChapter = "1";
                                chapterIndex = 0;
                                dropDownVerse = "1";
                                verseIndex = 0;
                                chapterList = [
                                  "1",
                                  "2",
                                  "3",
                                  "4",
                                  "5",
                                  "6",
                                  "7",
                                  "8",
                                  "9",
                                  "10",
                                  "11",
                                  "12",
                                  "13",
                                  "14",
                                  "15",
                                  "16",
                                  "17",
                                  "18",
                                  "19",
                                  "20",
                                  "21",
                                  "22",
                                  "23",
                                  '24',
                                  "25",
                                  "26",
                                  "27",
                                  "28",
                                  "29",
                                  "30",
                                  "31",
                                  "32",
                                  "33",
                                  "34",
                                  "35",
                                  "36",
                                  "37",
                                  "38",
                                  "39",
                                  "40",
                                  "41",
                                  "42",
                                  "43",
                                  "44",
                                  "45",
                                  "46",
                                  "47",
                                  "48",
                                  "49",
                                  "50"
                                ];
                              });
                            },
                          ),

                          //CHAPTERS SELECTION DROPDOWN
                          //======================================
                          DropdownButton(
                            // Initial Value
                            value: dropDownChapter,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: chapterList.map((e) {
                              return DropdownMenuItem(
                                value: e.toString(),
                                child: Text(e.toString()),
                              );
                            }).toList(),

                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropDownChapter = newValue!;
                                chapterIndex = getChapterIndex(newValue);
                                versesIndexLists = porpulateVerseList(
                                    chapterIndex, bookIndex, bibleList);
                              });
                            },
                            onTap: () {},
                          ),

                          //VERSES SELECTION DROPDOWN
                          //======================================
                          DropdownButton(
                            // Initial Value
                            value: dropDownVerse,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: versesIndexLists.map((e) {
                              return DropdownMenuItem(
                                value: e.toString(),
                                child: Text(e.toString()),
                              );
                            }).toList(),

                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropDownVerse = newValue!;
                                verseIndex = getVerseIndex(newValue);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: ListView.builder(
                        controller: ScrollController(
                          initialScrollOffset:
                              3000, // or whatever offset you wish
                          keepScrollOffset: true,
                        ),
                        itemBuilder: (context, index) => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              AppText(
                                text:
                                    "${(bibleList[bookIndex].chapters[chapterIndex].indexOf(bibleList[bookIndex].chapters[chapterIndex][index]) + 1).toString()}",
                                color: Colors.red,
                                size:26,
                              ),
                              AppText(
                                text: bibleList[bookIndex]
                                    .chapters[chapterIndex][index]
                                    .toString(),
                                size:30,
                              ),
                            ]),
                        itemCount:
                            bibleList[bookIndex].chapters[chapterIndex].length,
                      ),
                    ),
                  ),
                ]));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  late List<dynamic> bibleList;

  Future<List<BibleDataModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString("jasonfiles/en_kjv.json");
    final list = json.decode(jsondata) as List<dynamic>;
    var data = list.map((e) => BibleDataModel.fromJson(e)).toList();
    setState(() {
      bibleList = data;
    });
    return data;
  }
}
