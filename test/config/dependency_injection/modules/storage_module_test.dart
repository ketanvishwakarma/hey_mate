import 'package:flutter_test/flutter_test.dart';
import 'package:hey_mate/config/dependency_injection/dependency_injection.dart';
import 'package:hey_mate/config/dependency_injection/modules/storage_module.dart';
import 'package:hey_mate/features/todo/data/dtos/todo/todo_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';

class TestStorageModule extends StorageModule {}

void main() {
  final storageModule = TestStorageModule();

  setUp(() async {
    await setUpTestHive();
    await registerHiveTypeAdapters();
  });

  test('isAdapterRegistered', () {
    final isTodoDtoAdapterIsRegistered =
        Hive.isAdapterRegistered(TodoDtoAdapter().typeId);
    expect(isTodoDtoAdapterIsRegistered, true);
  });

  test('verify get todoBox', () async {
    await storageModule.todoBox;
    final isBoxIsOpened = Hive.isBoxOpen('todoBox');
    expect(isBoxIsOpened, true);
  });

  /// Automatic called after test completed
  tearDown(() async {
    await tearDownTestHive();
  });
}
