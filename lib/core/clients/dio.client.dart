import 'package:dio/dio.dart';
import 'package:dio/io.dart';

/// {@category Core}
/// {@subCategory Infrastructure}
///
/// Dio client class to make http requests
class DioClient extends DioForNative {
  ///
  /// Get default [BaseOptions]
  ///
  static BaseOptions _baseOptions(String baseUrl) =>
      BaseOptions()
        ..followRedirects = true
        ..baseUrl = baseUrl
        ..connectTimeout = const Duration(seconds: 30)
        ..contentType = Headers.formUrlEncodedContentType;

  ///
  /// Constructor
  ///
  DioClient._(String baseUrl) : super(_baseOptions(baseUrl));

  /// basic factory
  factory DioClient.basic(String baseUrl) {
    return DioClient._(baseUrl);
  }
}
