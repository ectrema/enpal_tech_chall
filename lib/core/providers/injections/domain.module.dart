// coverage:ignore-file

import 'package:enpal_tech_chall/domain/repositories/monitoring.repository.dart';
import 'package:enpal_tech_chall/domain/services/monitoring.service.dart';
import 'package:enpal_tech_chall/domain/use_cases/monitoring/get_monitoring.use_case.dart';
import 'package:injectable/injectable.dart';

/// Module to inject dependencies
@module
abstract class DomainModule {
  @singleton
  GetMonitoringUseCase getMonitoringUseCase(
    MonitoringRepository monitoringRepository,
  ) => GetMonitoringUseCase(monitoringRepository: monitoringRepository);

  @singleton
  MonitoringService monitoringService(
    GetMonitoringUseCase getMonitoringUseCase,
  ) => MonitoringService(getMonitoringUseCase: getMonitoringUseCase);
}
