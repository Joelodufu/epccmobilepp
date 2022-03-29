import 'package:flutter_app/models/bible_data_model.dart';

class BibleStudyModel {
  BibleStudyModel({
    this.date,
    this.theme,
    this.topic,
    this.text,
    this.contents,
  });

  String? date;
  String? theme;
  String? topic;
  String? text;
  List<dynamic>? contents;

  BibleStudyModel.fromJson(Map<String, dynamic> json) {
    date = json["date"];
    theme = json["theme"];
    topic = json["topic"];
    text = json["text"];
    contents = json["contents"];
  }
}
