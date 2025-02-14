import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/core/providers/initializer.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/use_cases/monitoring/get_monitoring.use_case.dart';
import 'package:enpal_tech_chall/ui/screens/main/solar/solar.view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'solar.view_model.g.dart';

///
/// [SolarViewModel]
///
@riverpod
class SolarViewModel extends _$SolarViewModel {
  final GetMonitoringUseCase _getMonitoringUseCase;

  factory SolarViewModel() {
    return SolarViewModel._(
      getMonitoringUseCase: injector<GetMonitoringUseCase>(),
    );
  }

  SolarViewModel._({required GetMonitoringUseCase getMonitoringUseCase})
    : _getMonitoringUseCase = getMonitoringUseCase;

  @override
  SolarState build() => SolarState.initial();

  Future<void> getMonitoring() async {
    try {
      final List<MonitoringEntity> result = await _getMonitoringUseCase.execute(
        (state.date, EnergyType.solar),
      );

      state = state.copyWith(monitoring: result, loading: false);
    } catch (e) {
      state = state.copyWith(loading: false);
    }
  }

  void setDate(DateTime date) {
    state = state.copyWith(date: date);
    getMonitoring();
  }
}
