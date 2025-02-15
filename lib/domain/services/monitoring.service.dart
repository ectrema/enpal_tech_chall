import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/use_cases/monitoring/get_monitoring.use_case.dart';
import 'package:rxdart/rxdart.dart' show BehaviorSubject;

/// Service class that manages monitoring data streams for solar, battery and house energy
/// using RxDart's BehaviorSubject for reactive state management.
///
/// This service:
/// - Maintains separate streams for solar, battery and house monitoring data
/// - Handles data fetching and error handling for each energy type
/// - Provides broadcast streams that can be listened to by multiple subscribers
final class MonitoringService {
  /// Use case for retrieving monitoring data
  final GetMonitoringUseCase _getMonitoringUseCase;

  /// Stream controller for solar monitoring data
  final BehaviorSubject<List<MonitoringEntity>> _solarMonitoring =
      BehaviorSubject<List<MonitoringEntity>>.seeded(<MonitoringEntity>[]);

  /// Public stream of solar monitoring data
  Stream<List<MonitoringEntity>> get solarMonitoring =>
      _solarMonitoring.stream.asBroadcastStream();

  /// Stream controller for battery monitoring data
  final BehaviorSubject<List<MonitoringEntity>> _batteryMonitoring =
      BehaviorSubject<List<MonitoringEntity>>.seeded(<MonitoringEntity>[]);

  /// Public stream of battery monitoring data
  Stream<List<MonitoringEntity>> get batteryMonitoring =>
      _batteryMonitoring.stream.asBroadcastStream();

  /// Stream controller for house monitoring data
  final BehaviorSubject<List<MonitoringEntity>> _houseMonitoring =
      BehaviorSubject<List<MonitoringEntity>>.seeded(<MonitoringEntity>[]);

  /// Public stream of house monitoring data
  Stream<List<MonitoringEntity>> get houseMonitoring =>
      _houseMonitoring.stream.asBroadcastStream();

  /// Creates a new instance of [MonitoringService] and initializes monitoring data
  /// for all energy types with current date
  MonitoringService({required GetMonitoringUseCase getMonitoringUseCase})
    : _getMonitoringUseCase = getMonitoringUseCase {
    getSolarMonitoring(DateTime.now());
    getBatteryMonitoring(DateTime.now());
    getHouseMonitoring(DateTime.now());
  }

  /// Fetches solar monitoring data for the specified date
  ///
  /// Updates the solar monitoring stream with new data or error if fetch fails
  Future<void> getSolarMonitoring(DateTime date) async {
    try {
      final List<MonitoringEntity> solarMonitoring = await _getMonitoringUseCase
          .execute((date, EnergyType.solar));
      _solarMonitoring.add(solarMonitoring);
    } catch (e) {
      _solarMonitoring.addError(e);
    }
  }

  /// Fetches battery monitoring data for the specified date
  ///
  /// Updates the battery monitoring stream with new data or error if fetch fails
  Future<void> getBatteryMonitoring(DateTime date) async {
    try {
      final List<MonitoringEntity> batteryMonitoring =
          await _getMonitoringUseCase.execute((date, EnergyType.battery));
      _batteryMonitoring.add(batteryMonitoring);
    } catch (e) {
      _batteryMonitoring.addError(e);
    }
  }

  /// Fetches house monitoring data for the specified date
  ///
  /// Updates the house monitoring stream with new data or error if fetch fails
  Future<void> getHouseMonitoring(DateTime date) async {
    try {
      final List<MonitoringEntity> houseMonitoring = await _getMonitoringUseCase
          .execute((date, EnergyType.house));
      _houseMonitoring.add(houseMonitoring);
    } catch (e) {
      _houseMonitoring.addError(e);
    }
  }
}
