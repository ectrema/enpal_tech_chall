import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/data/networking/responses/monitoring.model.dart';

/// [MonitoringRemoteDataSource]
abstract class MonitoringRemoteDataSource {
  Future<List<MonitoringRemoteModel>> getMonitoring({
    required DateTime date,
    required EnergyType energyType,
  });
}
