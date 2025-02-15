import 'package:enpal_tech_chall/core/providers/initializer.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/services/monitoring.service.dart';
import 'package:enpal_tech_chall/ui/screens/main/solar/solar.view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'solar.view_model.g.dart';

///
/// [SolarViewModel]
///
@riverpod
class SolarViewModel extends _$SolarViewModel {
  final MonitoringService _monitoringService;

  factory SolarViewModel() {
    return SolarViewModel._(monitoringService: injector<MonitoringService>());
  }

  SolarViewModel._({required MonitoringService monitoringService})
    : _monitoringService = monitoringService;

  @override
  SolarState build() => SolarState.initial();

  Future<void> getMonitoring() async {
    _monitoringService.solarMonitoring.listen((List<MonitoringEntity> value) {
      state = state.copyWith(monitoring: value);
    });
  }

  void setDate(DateTime date) {
    state = state.copyWith(date: date);
    _monitoringService.getSolarMonitoring(date);
  }

  void setShowInKiloWatt(bool showInKiloWatt) {
    state = state.copyWith(showInKiloWatt: showInKiloWatt);
  }
}
