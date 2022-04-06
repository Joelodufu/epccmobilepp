import "package:hive/hive.dart";

part 'devotional.g.dart';
@HiveType(typeId: 0)

class Devotional extends HiveObject {
  @HiveField(0)
  late String topic;

  @HiveField(1)
  late String bibleLink;

  @HiveField(2)
  late String bibleText;

  @HiveField(3)
  late String insight;

  @HiveField(4)
  late String prayer;
}