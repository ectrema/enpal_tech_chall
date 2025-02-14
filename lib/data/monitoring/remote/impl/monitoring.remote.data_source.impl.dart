import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:enpal_tech_chall/data/monitoring/remote/monitoring.remote.data_source.dart';
import 'package:enpal_tech_chall/data/networking/endpoints/monitoring.endpoint.dart';
import 'package:enpal_tech_chall/data/networking/responses/monitoring.model.dart';

/// [MonitoringRemoteDataSourceImpl]
final class MonitoringRemoteDataSourceImpl
    implements MonitoringRemoteDataSource {
  final MonitoringEndpoint _monitoringEndpoint;

  MonitoringRemoteDataSourceImpl({
    required MonitoringEndpoint monitoringEndpoint,
  }) : _monitoringEndpoint = monitoringEndpoint;

  @override
  Future<List<MonitoringRemoteModel>> getMonitoring({
    required DateTime date,
    required EnergyType energyType,
  }) async {
    return _monitoringEndpoint.getMonitoring(
      date: DateFormat('yyyy-MM-dd').format(date),
      energyType: energyType,
    );
  }
}
