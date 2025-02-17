import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/data/monitoring/remote/monitoring.remote.data_source.dart';
import 'package:enpal_tech_chall/data/networking/responses/monitoring.model.dart';
import 'package:enpal_tech_chall/data/repositories_impl/monitoring.repository.impl.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'monitoring.repository.impl_test.mocks.dart';

@GenerateNiceMocks(<MockSpec<MonitoringRemoteDataSource>>[
  MockSpec<MonitoringRemoteDataSource>(),
])
void main() {
  late MonitoringRepositoryImpl repository;
  late MockMonitoringRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockMonitoringRemoteDataSource();
    repository = MonitoringRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group('MonitoringRepositoryImpl', () {
    group('getMonitoring', () {
      test('should return list of entities from remote data source', () async {
        // Arrange
        final DateTime testDate = DateTime(2024);
        final EnergyType testEnergyType = EnergyType.solar;
        final List<MonitoringRemoteModel> remoteModels =
            <MonitoringRemoteModel>[
              MonitoringRemoteModel(value: 100, timestamp: '2024-01-01'),
              MonitoringRemoteModel(value: 200, timestamp: '2024-01-01'),
            ];
        final List<MonitoringEntity> expectedEntities =
            remoteModels.map(MonitoringEntity.fromRemote).toList();

        when(
          mockRemoteDataSource.getMonitoring(
            date: anyNamed('date'),
            energyType: anyNamed('energyType'),
          ),
        ).thenAnswer((_) async => remoteModels);

        // Act
        final List<MonitoringEntity> result = await repository.getMonitoring(
          date: testDate,
          energyType: testEnergyType,
        );

        // Assert
        expect(result, equals(expectedEntities));
        verify(
          mockRemoteDataSource.getMonitoring(
            date: testDate,
            energyType: testEnergyType,
          ),
        ).called(1);
      });

      test('should propagate errors from remote data source', () async {
        // Arrange
        final DateTime testDate = DateTime(2024);
        final Exception testError = Exception('Test error');

        when(
          mockRemoteDataSource.getMonitoring(
            date: anyNamed('date'),
            energyType: anyNamed('energyType'),
          ),
        ).thenThrow(testError);

        // Act & Assert
        expect(
          () => repository.getMonitoring(
            date: testDate,
            energyType: EnergyType.solar,
          ),
          throwsA(equals(testError)),
        );
      });
    });
  });
}
