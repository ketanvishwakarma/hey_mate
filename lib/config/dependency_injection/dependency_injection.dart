import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/config/dependency_injection/dependency_injection.config.dart';
import 'package:todo/features/todo/data/dtos/todo/todo_dto.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await _registerHiveTypeAdapters();
  await getIt.init();
}

Future<void> _registerHiveTypeAdapters() async {
  Hive.registerAdapter(TodoDtoAdapter());
}
