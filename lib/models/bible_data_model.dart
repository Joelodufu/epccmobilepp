class BibleDataModel {
  String? book;
  List? chapters;

  BibleDataModel({this.book, this.chapters});

  BibleDataModel.fromJson(Map<String, dynamic> json){
    book = json["name"];
    chapters=json["chapters"];
  }
}
