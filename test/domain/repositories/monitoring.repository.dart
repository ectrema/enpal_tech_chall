import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../use_cases/monitoring/get_monitoring.use_case_test.mocks.dart';

void main() {
  group('MonitoringRepository', () {
    late MockMonitoringRepository repository;
    late DateTime testDate;
    late List<MonitoringEntity> testData;

    setUp(() {
      repository = MockMonitoringRepository();
      testDate = DateTime(2023);
      testData = <MonitoringEntity>[
        MonitoringEntity(value: 100, date: testDate),
        MonitoringEntity(
          value: 200,
          date: testDate.add(const Duration(hours: 1)),
        ),
      ];
    });

    group('getMonitoring', () {
      test('should return monitoring data for solar energy type', () async {
        when(
          repository.getMonitoring(
            date: testDate,
            energyType: EnergyType.solar,
          ),
        ).thenAnswer((_) async => testData);

        final List<MonitoringEntity> result = await repository.getMonitoring(
          date: testDate,
          energyType: EnergyType.solar,
        );

        expect(result, equals(testData));
        verify(
          repository.getMonitoring(
            date: testDate,
            energyType: EnergyType.solar,
          ),
        ).called(1);
      });

      test('should return monitoring data for battery energy type', () async {
        when(
          repository.getMonitoring(
            date: testDate,
            energyType: EnergyType.battery,
          ),
        ).thenAnswer((_) async => testData);

        final List<MonitoringEntity> result = await repository.getMonitoring(
          date: testDate,
          energyType: EnergyType.battery,
        );

        expect(result, equals(testData));
        verify(
          repository.getMonitoring(
            date: testDate,
            energyType: EnergyType.battery,
          ),
        ).called(1);
      });

      test('should return monitoring data for house energy type', () async {
        when(
          repository.getMonitoring(
            date: testDate,
            energyType: EnergyType.house,
          ),
        ).thenAnswer((_) async => testData);

        final List<MonitoringEntity> result = await repository.getMonitoring(
          date: testDate,
          energyType: EnergyType.house,
        );

        expect(result, equals(testData));
        verify(
          repository.getMonitoring(
            date: testDate,
            energyType: EnergyType.house,
          ),
        ).called(1);
      });
    });
  });
}
