// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:front/config/di/modules/app_module.dart' as _i425;
import 'package:front/config/di/modules/enviroment_module.dart' as _i765;
import 'package:front/data/api/rest_client.dart' as _i929;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:talker_flutter/talker_flutter.dart' as _i207;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    final enviromentModule = _$EnviromentModule();
    gh.factory<_i207.Talker>(() => appModule.talker);
    gh.factory<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i929.RestClient>(
      () => _i929.RestClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'apiUrl'),
      ),
    );
    gh.factory<String>(() => enviromentModule.apiUrl, instanceName: 'apiUrl');
    return this;
  }
}

class _$AppModule extends _i425.AppModule {}

class _$EnviromentModule extends _i765.EnviromentModule {}
