// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hey_mate/config/dependency_injection/modules/storage_module.dart'
    as _i11;
import 'package:hey_mate/features/todo/application/todo_add_bloc/todo_add_bloc.dart'
    as _i9;
import 'package:hey_mate/features/todo/application/todo_list_bloc/todo_list_bloc.dart'
    as _i10;
import 'package:hey_mate/features/todo/data/dtos/todo/todo_dto.dart' as _i4;
import 'package:hey_mate/features/todo/data/local_sources/todo_local_source.dart'
    as _i5;
import 'package:hey_mate/features/todo/data/repositories/todo_repository_imp.dart'
    as _i8;
import 'package:hey_mate/features/todo/domain/repositories/todo_repository.dart'
    as _i7;
import 'package:hive/hive.dart' as _i6;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    await gh.lazySingletonAsync<_i3.Box<_i4.TodoDto>>(
      () => storageModule.todoBox,
      preResolve: true,
    );
    gh.factory<_i5.TodoLocalSource>(
        () => _i5.TodoLocalSourceImpl(gh<_i6.Box<_i4.TodoDto>>()),);
    gh.factory<_i7.TodoRepository>(
        () => _i8.TodoRepositoryImp(gh<_i5.TodoLocalSource>()),);
    gh.factory<_i9.TodoAddBloc>(
        () => _i9.TodoAddBloc(gh<_i7.TodoRepository>()),);
    gh.factory<_i10.TodoListBloc>(
        () => _i10.TodoListBloc(gh<_i7.TodoRepository>()),);
    return this;
  }
}

class _$StorageModule extends _i11.StorageModule {}
