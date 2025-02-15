import 'package:enpal_tech_chall/core/providers/initializer.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/services/monitoring.service.dart';
import 'package:enpal_tech_chall/ui/screens/main/battery/battery.view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'battery.view_model.g.dart';

///
/// [BatteryViewModel]
///
@riverpod
class BatteryViewModel extends _$BatteryViewModel {
  final MonitoringService _monitoringService;

  factory BatteryViewModel() {
    return BatteryViewModel._(monitoringService: injector<MonitoringService>());
  }

  BatteryViewModel._({required MonitoringService monitoringService})
    : _monitoringService = monitoringService;

  @override
  BatteryState build() => BatteryState.initial();

  void setListener() {
    _monitoringService.batteryMonitoring.listen((List<MonitoringEntity> value) {
      state = state.copyWith(monitoring: value);
    });
  }

  Future<void> reloadData() async {
    await _monitoringService.getBatteryMonitoring(state.date);
  }

  void setDate(DateTime date) {
    state = state.copyWith(date: date);
    _monitoringService.getBatteryMonitoring(date);
  }

  void setShowInKiloWatt(bool showInKiloWatt) {
    state = state.copyWith(showInKiloWatt: showInKiloWatt);
  }
}
