import 'package:hive/hive.dart';

part 'todo_dto.g.dart';

@HiveType(typeId: 0)
class TodoDto extends HiveObject {
  TodoDto({
    required this.id,
    required this.title,
    this.description = '',
    this.remainingDurationInSeconds = 600,
    this.status = 'Todo',
  });

  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  int remainingDurationInSeconds;
  @HiveField(4)
  String status;
}

extension DurationExtension on int {
  String get toDurationString {
    final minutes = (this / 60).floor().toString().padLeft(2, '0');
    final seconds = (this % 60).toString().padLeft(2, '0');
    return '${minutes}M : ${seconds}S';
  }
}
