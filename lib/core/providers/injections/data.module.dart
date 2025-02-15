import 'package:enpal_tech_chall/core/clients/dio.client.dart';
import 'package:enpal_tech_chall/data/monitoring/remote/impl/monitoring.remote.data_source.impl.dart';
import 'package:enpal_tech_chall/data/monitoring/remote/monitoring.remote.data_source.dart';
import 'package:enpal_tech_chall/data/networking/endpoints/monitoring.endpoint.dart';
import 'package:enpal_tech_chall/data/repositories_impl/monitoring.repository.impl.dart';
import 'package:enpal_tech_chall/domain/repositories/monitoring.repository.dart';
import 'package:enpal_tech_chall/domain/services/connectivity.service.dart';
import 'package:injectable/injectable.dart';

/// Module to inject dependencies
@module
abstract class DataModule {
  @singleton
  MonitoringEndpoint monitoringEndpoint(DioClient dioClient) =>
      MonitoringEndpoint(dioClient);

  @Singleton(as: MonitoringRemoteDataSource)
  MonitoringRemoteDataSourceImpl monitoringRemoteDataSource(
    MonitoringEndpoint monitoringEndpoint,
  ) => MonitoringRemoteDataSourceImpl(monitoringEndpoint: monitoringEndpoint);

  @Singleton(as: MonitoringRepository)
  MonitoringRepositoryImpl monitoringRepository(
    MonitoringRemoteDataSource remoteDataSource,
  ) => MonitoringRepositoryImpl(remoteDataSource: remoteDataSource);

  @singleton
  Future<ConnectivityService> connectivityService() async =>
      ConnectivityService.inject();
}
