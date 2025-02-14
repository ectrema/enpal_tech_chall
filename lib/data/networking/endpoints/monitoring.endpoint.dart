import 'package:dio/dio.dart';
import 'package:enpal_tech_chall/core/clients/dio.client.dart';
import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/data/networking/responses/monitoring.model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'monitoring.endpoint.g.dart';

/// Monitoring endpoints
@RestApi()
abstract class MonitoringEndpoint {
  /// Factory to create an instance
  @factoryMethod
  factory MonitoringEndpoint(DioClient dioClient) {
    return _MonitoringEndpoint(dioClient);
  }

  @GET('/monitoring')
  Future<List<MonitoringRemoteModel>> getMonitoring({
    @Query('date') required String date,
    @Query('type') required EnergyType energyType,
  });
}
