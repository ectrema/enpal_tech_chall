import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';

/// [MonitoringRepository]
abstract class MonitoringRepository {
  Future<List<MonitoringEntity>> getMonitoring({
    required DateTime date,
    required EnergyType energyType,
  });
}
