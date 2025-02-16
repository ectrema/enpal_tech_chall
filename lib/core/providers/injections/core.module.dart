// coverage:ignore-file

import 'package:enpal_tech_chall/core/clients/dio.client.dart';
import 'package:enpal_tech_chall/core/clients/interceptors/connectivity.interceptor.dart';
import 'package:enpal_tech_chall/core/theming/theme.dart';
import 'package:enpal_tech_chall/domain/services/connectivity.service.dart';
import 'package:injectable/injectable.dart';

/// Module to inject dependencies
@module
abstract class CoreModule {
  @injectable
  String apiUrl() => const String.fromEnvironment('API_URL');

  @singleton
  DioClient dioClient(String apiUrl) => DioClient.basic(apiUrl);

  @singleton
  AppTheme appTheme() => AppTheme();

  @singleton
  ConnectivityInterceptor connectivityInterceptor(
    DioClient dioClient,
    ConnectivityService connectivityService,
  ) => ConnectivityInterceptor(
    dioClient: dioClient,
    connectivityService: connectivityService,
  );
}
