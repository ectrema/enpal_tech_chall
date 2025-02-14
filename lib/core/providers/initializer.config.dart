// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:enpal_tech_chall/core/clients/dio.client.dart' as _i127;
import 'package:enpal_tech_chall/core/providers/injections/core.module.dart'
    as _i264;
import 'package:enpal_tech_chall/core/providers/injections/data.module.dart'
    as _i917;
import 'package:enpal_tech_chall/core/providers/injections/domain.module.dart'
    as _i511;
import 'package:enpal_tech_chall/core/theming/theme.dart' as _i894;
import 'package:enpal_tech_chall/data/monitoring/remote/monitoring.remote.data_source.dart'
    as _i640;
import 'package:enpal_tech_chall/data/networking/endpoints/monitoring.endpoint.dart'
    as _i793;
import 'package:enpal_tech_chall/domain/repositories/monitoring.repository.dart'
    as _i506;
import 'package:enpal_tech_chall/domain/use_cases/monitoring/get_monitoring.use_case.dart'
    as _i825;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreModule = _$CoreModule();
    final dataModule = _$DataModule();
    final domainModule = _$DomainModule();
    gh.factory<String>(() => coreModule.apiUrl());
    gh.singleton<_i894.AppTheme>(() => coreModule.appTheme());
    gh.singleton<_i127.DioClient>(() => coreModule.dioClient(gh<String>()));
    gh.singleton<_i793.MonitoringEndpoint>(
      () => dataModule.monitoringEndpoint(gh<_i127.DioClient>()),
    );
    gh.singleton<_i640.MonitoringRemoteDataSource>(
      () =>
          dataModule.monitoringRemoteDataSource(gh<_i793.MonitoringEndpoint>()),
    );
    gh.singleton<_i506.MonitoringRepository>(
      () => dataModule.monitoringRepository(
        gh<_i640.MonitoringRemoteDataSource>(),
      ),
    );
    gh.singleton<_i825.GetMonitoringUseCase>(
      () => domainModule.getMonitoringUseCase(gh<_i506.MonitoringRepository>()),
    );
    return this;
  }
}

class _$CoreModule extends _i264.CoreModule {}

class _$DataModule extends _i917.DataModule {}

class _$DomainModule extends _i511.DomainModule {}
