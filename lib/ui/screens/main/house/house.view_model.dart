import 'package:enpal_tech_chall/core/providers/initializer.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/services/monitoring.service.dart';
import 'package:enpal_tech_chall/ui/screens/main/house/house.view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'house.view_model.g.dart';

///
/// [HouseViewModel]
///
@riverpod
class HouseViewModel extends _$HouseViewModel {
  final MonitoringService _monitoringService;

  factory HouseViewModel() {
    return HouseViewModel._(monitoringService: injector<MonitoringService>());
  }

  HouseViewModel._({required MonitoringService monitoringService})
    : _monitoringService = monitoringService;

  @override
  HouseState build() => HouseState.initial();

  void setListener() {
    _monitoringService.houseMonitoring.listen((List<MonitoringEntity> value) {
      state = state.copyWith(monitoring: value);
    });
  }

  Future<void> reloadData() async {
    await _monitoringService.getHouseMonitoring(state.date);
  }

  void setDate(DateTime date) {
    state = state.copyWith(date: date);
    _monitoringService.getHouseMonitoring(date);
  }

  void setShowInKiloWatt(bool showInKiloWatt) {
    state = state.copyWith(showInKiloWatt: showInKiloWatt);
  }
}
