import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/repositories/monitoring.repository.dart';
import 'package:enpal_tech_chall/domain/use_cases/abstract/use_case_abs.dart';

final class GetMonitoringUseCase
    implements
        UseCaseWithParams<
          Future<List<MonitoringEntity>>,
          (DateTime, EnergyType)
        > {
  final MonitoringRepository _monitoringRepository;

  GetMonitoringUseCase({required MonitoringRepository monitoringRepository})
    : _monitoringRepository = monitoringRepository;

  @override
  Future<List<MonitoringEntity>> execute((DateTime, EnergyType) params) async {
    return _monitoringRepository.getMonitoring(
      date: params.$1,
      energyType: params.$2,
    );
  }
}
