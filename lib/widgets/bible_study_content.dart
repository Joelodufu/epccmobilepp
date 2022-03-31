import 'package:flutter/material.dart';

import 'app_text.dart';

class BibleStudyContent extends StatelessWidget {
  List bibleStudyList;
  BibleStudyContent({Key? key, required this.bibleStudyList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: ScrollController(
          // or whatever offset you wish
          ),
      itemBuilder: (context, index) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            AppText(
              text: "${bibleStudyList[0].topic}",
              color: Colors.red,
            ),
            AppText(
              text: "Hello to the whole world",
              size: 25,
            ),
          ]),
      itemCount: bibleStudyList.length,
    );
  }
}
