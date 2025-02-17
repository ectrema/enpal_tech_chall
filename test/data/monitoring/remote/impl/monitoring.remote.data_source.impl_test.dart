import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/data/monitoring/remote/impl/monitoring.remote.data_source.impl.dart';
import 'package:enpal_tech_chall/data/networking/endpoints/monitoring.endpoint.dart';
import 'package:enpal_tech_chall/data/networking/responses/monitoring.model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'monitoring.remote.data_source.impl_test.mocks.dart';

@GenerateNiceMocks(<MockSpec<MonitoringEndpoint>>[
  MockSpec<MonitoringEndpoint>(),
])
void main() {
  late MonitoringRemoteDataSourceImpl dataSource;
  late MockMonitoringEndpoint mockEndpoint;

  setUp(() {
    mockEndpoint = MockMonitoringEndpoint();
    dataSource = MonitoringRemoteDataSourceImpl(
      monitoringEndpoint: mockEndpoint,
    );
  });

  group('MonitoringRemoteDataSourceImpl', () {
    group('getMonitoring', () {
      test(
        'should format date and call endpoint with correct parameters',
        () async {
          // Arrange
          final DateTime testDate = DateTime(2024);
          final EnergyType testEnergyType = EnergyType.solar;
          final List<MonitoringRemoteModel> expectedResponse =
              <MonitoringRemoteModel>[
                MonitoringRemoteModel(value: 100, timestamp: '2024-01-01'),
              ];

          when(
            mockEndpoint.getMonitoring(
              date: anyNamed('date'),
              energyType: anyNamed('energyType'),
            ),
          ).thenAnswer((_) async => expectedResponse);

          // Act
          final List<MonitoringRemoteModel> result = await dataSource
              .getMonitoring(date: testDate, energyType: testEnergyType);

          // Assert
          expect(result, equals(expectedResponse));
          verify(
            mockEndpoint.getMonitoring(
              date: anyNamed('date'),
              energyType: anyNamed('energyType'),
            ),
          ).called(1);
        },
      );

      test('should propagate errors from endpoint', () async {
        // Arrange
        final DateTime testDate = DateTime(2024);
        final Exception testError = Exception('Test error');

        when(
          mockEndpoint.getMonitoring(
            date: anyNamed('date'),
            energyType: anyNamed('energyType'),
          ),
        ).thenThrow(testError);

        // Act & Assert
        expect(
          () => dataSource.getMonitoring(
            date: testDate,
            energyType: EnergyType.solar,
          ),
          throwsA(equals(testError)),
        );
      });
    });
  });
}
