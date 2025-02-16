import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/services/connectivity.service.dart';
import 'package:enpal_tech_chall/domain/services/monitoring.service.dart';
import 'package:enpal_tech_chall/ui/screens/main/solar/solar.view_model.dart';
import 'package:enpal_tech_chall/ui/screens/main/solar/solar.view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderContainer;
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart' show GenerateNiceMocks, MockSpec;
import 'package:mockito/mockito.dart';

import '../../../../mocks/fake_connectivity.dart';
import 'solar.view_model_test.mocks.dart';

@GenerateNiceMocks(<MockSpec<dynamic>>[
  MockSpec<MonitoringService>(),
  MockSpec<ConnectivityService>(),
])
void main() {
  late SolarViewModel viewModel;
  late MockMonitoringService mockMonitoringService;
  late ConnectivityService mockConnectivityService;
  late ProviderContainer container;

  setUpAll(() async {
    ConnectivityPlatform.instance = FakeConnectivityWithInternet();
    mockMonitoringService = MockMonitoringService();
    mockConnectivityService = await ConnectivityService.inject();
    container = ProviderContainer();

    GetIt.instance.registerSingleton<MonitoringService>(mockMonitoringService);
    GetIt.instance.registerSingleton<ConnectivityService>(
      mockConnectivityService,
    );

    viewModel = container.read(solarViewModelProvider.notifier);
  });

  group('SolarViewModel', () {
    test('initial state should be correct', () {
      final SolarState state = container.read(solarViewModelProvider);

      expect(state.isConnected, true);
      expect(state.monitoring, isEmpty);
      expect(state.showInKiloWatt, true);
      expect(state.date.day, DateTime.now().day);
    });

    test('setDate should update state and fetch new monitoring data', () {
      final DateTime newDate = DateTime(2023);

      viewModel.setDate(newDate);

      expect(viewModel.state.date, newDate);
      expect(viewModel.state.monitoring, isEmpty);
      verify(mockMonitoringService.getSolarMonitoring(newDate)).called(1);
    });

    test('setShowInKiloWatt should update state', () {
      viewModel.setShowInKiloWatt(true);

      expect(viewModel.state.showInKiloWatt, true);

      viewModel.setShowInKiloWatt(false);

      expect(viewModel.state.showInKiloWatt, false);
    });

    test(
      'reloadData should call getSolarMonitoring with current date',
      () async {
        await viewModel.reloadData();

        verify(
          mockMonitoringService.getSolarMonitoring(viewModel.state.date),
        ).called(1);
      },
    );

    test(
      'setListener should update state when new monitoring data arrives',
      () async {
        final List<MonitoringEntity> monitoringData = <MonitoringEntity>[
          MonitoringEntity(date: DateTime.now(), value: 100),
        ];

        when(mockMonitoringService.solarMonitoring).thenAnswer(
          (_) => Stream<List<MonitoringEntity>>.value(monitoringData),
        );

        viewModel.setListener();

        container.listen(solarViewModelProvider, (
          SolarState? previous,
          SolarState current,
        ) {
          expect(previous?.monitoring, isEmpty);
          expect(current.monitoring, equals(monitoringData));
          verify(
            mockMonitoringService.getSolarMonitoring(viewModel.state.date),
          ).called(1);
        });
      },
    );
  });
}
