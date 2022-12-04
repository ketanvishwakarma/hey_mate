import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/features/todo/data/dtos/todo/todo_dto.dart';

@module
abstract class StorageModule {
  @preResolve
  @lazySingleton
  Future<Box<TodoDto>> get todoBox {
    return Hive.openBox<TodoDto>('todoBox');
  }
}
