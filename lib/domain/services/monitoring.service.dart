import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/use_cases/monitoring/get_monitoring.use_case.dart';
import 'package:rxdart/rxdart.dart' show BehaviorSubject;

final class MonitoringService {
  final GetMonitoringUseCase _getMonitoringUseCase;

  final BehaviorSubject<List<MonitoringEntity>> _solarMonitoring =
      BehaviorSubject<List<MonitoringEntity>>.seeded(<MonitoringEntity>[]);
  Stream<List<MonitoringEntity>> get solarMonitoring =>
      _solarMonitoring.stream.asBroadcastStream();

  final BehaviorSubject<List<MonitoringEntity>> _batteryMonitoring =
      BehaviorSubject<List<MonitoringEntity>>.seeded(<MonitoringEntity>[]);
  Stream<List<MonitoringEntity>> get batteryMonitoring =>
      _batteryMonitoring.stream.asBroadcastStream();

  final BehaviorSubject<List<MonitoringEntity>> _houseMonitoring =
      BehaviorSubject<List<MonitoringEntity>>.seeded(<MonitoringEntity>[]);
  Stream<List<MonitoringEntity>> get houseMonitoring =>
      _houseMonitoring.stream.asBroadcastStream();

  MonitoringService({required GetMonitoringUseCase getMonitoringUseCase})
    : _getMonitoringUseCase = getMonitoringUseCase {
    getSolarMonitoring(DateTime.now());
    getBatteryMonitoring(DateTime.now());
    getHouseMonitoring(DateTime.now());
  }

  Future<void> getSolarMonitoring(DateTime date) async {
    try {
      final List<MonitoringEntity> solarMonitoring = await _getMonitoringUseCase
          .execute((date, EnergyType.solar));
      _solarMonitoring.add(solarMonitoring);
    } catch (e) {
      _solarMonitoring.addError(e);
    }
  }

  Future<void> getBatteryMonitoring(DateTime date) async {
    try {
      final List<MonitoringEntity> batteryMonitoring =
          await _getMonitoringUseCase.execute((date, EnergyType.battery));
      _batteryMonitoring.add(batteryMonitoring);
    } catch (e) {
      _batteryMonitoring.addError(e);
    }
  }

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
