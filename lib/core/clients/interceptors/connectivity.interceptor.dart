import 'package:dio/dio.dart';
import 'package:enpal_tech_chall/core/clients/dio.client.dart';
import 'package:enpal_tech_chall/domain/services/connectivity.service.dart';

/// [ConnectivityInterceptor]
class ConnectivityInterceptor {
  /// [DioClient]
  final DioClient _dioClient;

  final ConnectivityService _connectivityService;

  /// Constructor
  ConnectivityInterceptor({
    required DioClient dioClient,
    required ConnectivityService connectivityService,
  }) : _dioClient = dioClient,
       _connectivityService = connectivityService {
    _registerInterceptor();
  }

  void _registerInterceptor() {
    _dioClient.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (
          RequestOptions requestOptions,
          RequestInterceptorHandler handler,
        ) async {
          if (_connectivityService.isConnected) {
            return handler.next(requestOptions);
          }
          return handler.reject(
            DioException(
              requestOptions: requestOptions,
              type: DioExceptionType.connectionError,
            ),
          );
        },
      ),
    );
  }
}
