import 'package:flutter_test/flutter_test.dart';
import 'package:hey_mate/config/dependency_injection/dependency_injection.dart';
import 'package:hey_mate/features/todo/data/dtos/todo/todo_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';

void main() {
  setUp(() async {
    await setUpTestHive();
    await registerHiveTypeAdapters();
  });

  test('isAdapterRegistered', () {
    final isTodoDtoAdapterIsRegistered =
        Hive.isAdapterRegistered(TodoDtoAdapter().typeId);
    expect(isTodoDtoAdapterIsRegistered, true);
  });

  tearDown(() async {
    await tearDownTestHive();
  });
}
