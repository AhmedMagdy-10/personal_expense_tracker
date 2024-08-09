import 'package:hive/hive.dart';

part 'details_mony_model.g.dart';

@HiveType(typeId: 0)
class DetailsMonyModel extends HiveObject {
  @HiveField(0)
  final String userId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final num addOrRmoveMony;
  @HiveField(3)
  final String dateTime;

  DetailsMonyModel({
    required this.userId,
    required this.addOrRmoveMony,
    required this.title,
    required this.dateTime,
  });
}
