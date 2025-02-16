import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/repositories/monitoring.repository.dart';
import 'package:enpal_tech_chall/domain/use_cases/monitoring/get_monitoring.use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_monitoring.use_case_test.mocks.dart';

// ignore: always_specify_types
@GenerateNiceMocks(<MockSpec>[MockSpec<MonitoringRepository>()])
void main() {
  late final GetMonitoringUseCase usecase;
  late final MockMonitoringRepository mockMonitoringRepository;

  setUp(() {
    mockMonitoringRepository = MockMonitoringRepository();
    usecase = GetMonitoringUseCase(
      monitoringRepository: mockMonitoringRepository,
    );
  });

  group('GetMonitoringUseCase', () {
    test('should get monitoring data from repository', () async {
      // Arrange
      final EnergyType energyType = EnergyType.solar;
      final DateTime date = DateTime(2024);
      final List<MonitoringEntity> expectedMonitoring = <MonitoringEntity>[
        MonitoringEntity(value: 100, date: date),
        MonitoringEntity(value: 200, date: date),
      ];

      when(
        mockMonitoringRepository.getMonitoring(
          date: anyNamed('date'),
          energyType: anyNamed('energyType'),
        ),
      ).thenAnswer(
        (_) => Future<List<MonitoringEntity>>.value(expectedMonitoring),
      );

      // Act
      final List<MonitoringEntity> result = await usecase.execute((
        date,
        energyType,
      ));

      // Assert
      expect(result, equals(expectedMonitoring));
      verify(
        mockMonitoringRepository.getMonitoring(
          date: anyNamed('date'),
          energyType: anyNamed('energyType'),
        ),
      ).called(1);
    });
  });
}
