import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';

/// Abstract repository class for accessing monitoring data
///
/// This repository defines the contract for retrieving monitoring data:
/// - Provides method to fetch monitoring data for a specific date and energy type
/// - Returns monitoring data as a list of [MonitoringEntity] objects
/// - Used by use cases and services to access monitoring data in a decoupled way
abstract class MonitoringRepository {
  /// Retrieves monitoring data for the specified date and energy type
  ///
  /// Parameters:
  /// - [date]: The date for which to retrieve monitoring data
  /// - [energyType]: The type of energy monitoring data to retrieve (solar/battery/house)
  ///
  /// Returns a Future that resolves to a list of [MonitoringEntity] containing the monitoring data
  Future<List<MonitoringEntity>> getMonitoring({
    required DateTime date,
    required EnergyType energyType,
  });
}
