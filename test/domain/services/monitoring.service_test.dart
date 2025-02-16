import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/services/monitoring.service.dart';
import 'package:enpal_tech_chall/domain/use_cases/monitoring/get_monitoring.use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../use_cases/monitoring/get_monitoring.use_case_test.mocks.dart';

void main() {
  late MockMonitoringRepository mockMonitoringRepository;
  late GetMonitoringUseCase getMonitoringUseCase;
  late MonitoringService monitoringService;
  late DateTime testDate;

  setUp(() {
    mockMonitoringRepository = MockMonitoringRepository();
    getMonitoringUseCase = GetMonitoringUseCase(
      monitoringRepository: mockMonitoringRepository,
    );
    monitoringService = MonitoringService(
      getMonitoringUseCase: getMonitoringUseCase,
    );
    testDate = DateTime(2024);
  });

  group('MonitoringService', () {
    test('initializes with empty monitoring data', () {
      expect(monitoringService.solarMonitoring, emits(<MonitoringEntity>[]));
      expect(monitoringService.batteryMonitoring, emits(<MonitoringEntity>[]));
      expect(monitoringService.houseMonitoring, emits(<MonitoringEntity>[]));
    });

    group('getSolarMonitoring', () {
      test('emits solar monitoring data on successful fetch', () async {
        final List<MonitoringEntity> testData = <MonitoringEntity>[
          MonitoringEntity(value: 100, date: testDate),
        ];

        when(
          mockMonitoringRepository.getMonitoring(
            date: anyNamed('date'),
            energyType: anyNamed('energyType'),
          ),
        ).thenAnswer((_) async => testData);

        await monitoringService.getSolarMonitoring(testDate);

        expect(monitoringService.solarMonitoring, emits(testData));
      });

      test('emits error when fetch fails', () async {
        final Exception testError = Exception('Test error');

        when(
          mockMonitoringRepository.getMonitoring(
            date: anyNamed('date'),
            energyType: anyNamed('energyType'),
          ),
        ).thenThrow(testError);

        await monitoringService.getSolarMonitoring(testDate);

        expect(monitoringService.solarMonitoring, emitsError(testError));
      });
    });

    group('getBatteryMonitoring', () {
      test('emits battery monitoring data on successful fetch', () async {
        final List<MonitoringEntity> testData = <MonitoringEntity>[
          MonitoringEntity(value: 75, date: testDate),
        ];

        when(
          mockMonitoringRepository.getMonitoring(
            date: anyNamed('date'),
            energyType: anyNamed('energyType'),
          ),
        ).thenAnswer((_) async => testData);

        await monitoringService.getBatteryMonitoring(testDate);

        expect(monitoringService.batteryMonitoring, emits(testData));
      });

      test('emits error when fetch fails', () async {
        final Exception testError = Exception('Test error');

        when(
          mockMonitoringRepository.getMonitoring(
            date: anyNamed('date'),
            energyType: anyNamed('energyType'),
          ),
        ).thenThrow(testError);

        await monitoringService.getBatteryMonitoring(testDate);

        expect(monitoringService.batteryMonitoring, emitsError(testError));
      });
    });

    group('getHouseMonitoring', () {
      test('emits house monitoring data on successful fetch', () async {
        final List<MonitoringEntity> testData = <MonitoringEntity>[
          MonitoringEntity(value: 50, date: testDate),
        ];

        when(
          mockMonitoringRepository.getMonitoring(
            date: anyNamed('date'),
            energyType: anyNamed('energyType'),
          ),
        ).thenAnswer((_) async => testData);

        await monitoringService.getHouseMonitoring(testDate);

        expect(monitoringService.houseMonitoring, emits(testData));
      });

      test('emits error when fetch fails', () async {
        final Exception testError = Exception('Test error');

        when(
          mockMonitoringRepository.getMonitoring(
            date: anyNamed('date'),
            energyType: anyNamed('energyType'),
          ),
        ).thenThrow(testError);

        await monitoringService.getHouseMonitoring(testDate);

        expect(monitoringService.houseMonitoring, emitsError(testError));
      });
    });
  });
}
