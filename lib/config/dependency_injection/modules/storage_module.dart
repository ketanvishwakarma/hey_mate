import 'package:hey_mate/features/todo/data/dtos/todo/todo_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class StorageModule {
  @preResolve
  @lazySingleton
  Future<Box<TodoDto>> get todoBox {
    return Hive.openBox<TodoDto>('todoBox');
  }
}
