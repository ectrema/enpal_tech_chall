import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/repositories/monitoring.repository.dart';
import 'package:enpal_tech_chall/domain/use_cases/abstract/use_case_abs.dart';

/// Use case for retrieving monitoring data for a specific date and energy type
///
/// This use case implements [UseCaseWithParams] with parameters:
/// - A tuple containing a [DateTime] for the date and [EnergyType] for the type of energy
/// - Returns a [Future] of List<[MonitoringEntity]> containing the monitoring data
final class GetMonitoringUseCase
    implements
        UseCaseWithParams<
          Future<List<MonitoringEntity>>,
          (DateTime, EnergyType)
        > {
  /// Repository for accessing monitoring data
  final MonitoringRepository _monitoringRepository;

  /// Creates a new instance of [GetMonitoringUseCase]
  ///
  /// Requires a [MonitoringRepository] for data access
  GetMonitoringUseCase({required MonitoringRepository monitoringRepository})
    : _monitoringRepository = monitoringRepository;

  /// Executes the use case to retrieve monitoring data
  ///
  /// Takes a tuple of [DateTime] and [EnergyType] as parameters
  /// Returns a [Future] of [List<MonitoringEntity>] containing the monitoring data
  @override
  Future<List<MonitoringEntity>> execute((DateTime, EnergyType) params) async {
    return _monitoringRepository.getMonitoring(
      date: params.$1,
      energyType: params.$2,
    );
  }
}
