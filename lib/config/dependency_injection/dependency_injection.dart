import 'package:get_it/get_it.dart';
import 'package:hey_mate/config/dependency_injection/dependency_injection.config.dart';
import 'package:hey_mate/features/todo/data/dtos/todo/todo_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await Hive.initFlutter();
  await _registerHiveTypeAdapters();
  await getIt.init();
}

Future<void> _registerHiveTypeAdapters() async {
  Hive.registerAdapter(TodoDtoAdapter());
}
