import 'package:enpal_tech_chall/core/clients/dio.client.dart';
import 'package:enpal_tech_chall/core/theming/theme.dart';
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
}
