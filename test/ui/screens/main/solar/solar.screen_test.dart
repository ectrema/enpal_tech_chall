import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart'
    show ConnectivityPlatform;
import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/services/connectivity.service.dart';
import 'package:enpal_tech_chall/domain/services/monitoring.service.dart';
import 'package:enpal_tech_chall/ui/screens/main/solar/solar.screen.dart';
import 'package:enpal_tech_chall/ui/screens/main/solar/solar.view_model.dart';
import 'package:enpal_tech_chall/ui/widget/no_internet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart' show any, when;

import '../../../../mocks/fake_connectivity.dart';
import '../../../setup.dart';
import 'solar.view_model_test.mocks.dart';

void main() {
  group('SolarScreen', () {
    late MockMonitoringService mockMonitoringService;

    tearDown(() {
      GetIt.instance.reset();
    });

    group('With internet', () {
      setUpAll(() async {
        ConnectivityPlatform.instance = FakeConnectivityWithInternet();
        mockMonitoringService = MockMonitoringService();
        GetIt.instance.registerSingleton<MonitoringService>(
          mockMonitoringService,
        );
        GetIt.instance.registerSingleton<ConnectivityService>(
          await ConnectivityService.inject(),
        );
        when(
          mockMonitoringService.getSolarMonitoring(any),
        ).thenAnswer((_) async => <MonitoringEntity>[]);
      });

      testWidgets('renders correctly', (WidgetTester tester) async {
        await pumpApp(
          home: const SolarScreen(),
          tester: tester,
          overrides: <Override>[],
        );

        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.text(LocaleKeys.solar_generation.tr()), findsOneWidget);
        expect(find.byType(RefreshIndicator), findsOneWidget);
        expect(find.byType(NoInternetWidget), findsOneWidget);
        expect(find.byType(CustomScrollView), findsOneWidget);
      });
    });

    group('Show in Watts', () {
      setUpAll(() async {
        ConnectivityPlatform.instance = FakeConnectivityWithInternet();
        mockMonitoringService = MockMonitoringService();
        GetIt.instance.registerSingleton<MonitoringService>(
          mockMonitoringService,
        );
        GetIt.instance.registerSingleton<ConnectivityService>(
          await ConnectivityService.inject(),
        );
        when(mockMonitoringService.getSolarMonitoring(any)).thenAnswer(
          (_) async => <MonitoringEntity>[
            MonitoringEntity(date: DateTime.now(), value: 1000),
          ],
        );
      });

      testWidgets('show data in Watts', (WidgetTester tester) async {
        final SolarViewModel viewModel = SolarViewModel();

        await pumpApp(
          home: const SolarScreen(),
          tester: tester,
          overrides: <Override>[
            solarViewModelProvider.overrideWith(() => viewModel),
          ],
        );

        viewModel.setShowInKiloWatt(false);

        await tester.pumpAndSettle();

        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.byType(RefreshIndicator), findsOneWidget);
        expect(find.byType(NoInternetWidget), findsOneWidget);
        expect(find.byType(CustomScrollView), findsOneWidget);
        expect(viewModel.state.showInKiloWatt, false);
      });
    });

    group('Without internet', () {
      setUpAll(() async {
        ConnectivityPlatform.instance = FakeConnectivityWithoutInternet();
        mockMonitoringService = MockMonitoringService();
        GetIt.instance.registerSingleton<MonitoringService>(
          mockMonitoringService,
        );
        GetIt.instance.registerSingleton<ConnectivityService>(
          await ConnectivityService.inject(),
        );
        when(
          mockMonitoringService.getSolarMonitoring(any),
        ).thenAnswer((_) async => <MonitoringEntity>[]);
      });
      testWidgets('show no internet widget when offline', (
        WidgetTester tester,
      ) async {
        await pumpApp(
          home: const SolarScreen(),
          tester: tester,
          overrides: <Override>[],
        );

        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.text(LocaleKeys.solar_generation.tr()), findsOneWidget);
        expect(find.byType(RefreshIndicator), findsOneWidget);
        expect(find.byType(CustomScrollView), findsNothing);
        expect(
          find.text(LocaleKeys.no_internet_connection_title.tr()),
          findsOneWidget,
        );
      });
    });
  });
}
