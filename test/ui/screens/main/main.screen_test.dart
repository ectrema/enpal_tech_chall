import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:enpal_tech_chall/core/routing/app_router.dart';
import 'package:enpal_tech_chall/domain/services/connectivity.service.dart';
import 'package:enpal_tech_chall/domain/services/monitoring.service.dart';
import 'package:enpal_tech_chall/ui/screens/main/main.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../../../mocks/fake_connectivity.dart';
import '../../setup.dart';
import 'solar/solar.view_model_test.mocks.dart';

void main() {
  group('MainScreen', () {
    setUp(() async {
      ConnectivityPlatform.instance = FakeConnectivityWithInternet();
      ConnectivityPlatform.instance = FakeConnectivityWithInternet();
      GetIt.instance.registerSingleton<MonitoringService>(
        MockMonitoringService(),
      );
      GetIt.instance.registerSingleton<ConnectivityService>(
        await ConnectivityService.inject(),
      );
    });

    tearDown(() {
      GetIt.instance.reset();
    });

    testWidgets('renders navigation shell', (WidgetTester tester) async {
      await pumpApp(
        home: MaterialApp.router(
          routerConfig: router,
          builder: (_, Widget? child) => child!,
          title: 'Enpal Tech Chall',
          debugShowCheckedModeBanner: false,
        ),
        tester: tester,
      );

      expect(find.byType(MainScreen), findsOneWidget);
    });

    testWidgets('renders 3 navigation items with correct info', (
      WidgetTester tester,
    ) async {
      await pumpApp(
        tester: tester,
        home: ProviderScope(
          child: MaterialApp.router(
            routerConfig: router,
            builder: (_, Widget? child) => child!,
            title: 'Enpal Tech Chall',
            debugShowCheckedModeBanner: false,
          ),
        ),
      );

      // Verify solar tab
      expect(find.text(LocaleKeys.solar.tr()), findsOneWidget);
      expect(find.byIcon(Icons.solar_power), findsOneWidget);

      // Verify house tab
      expect(find.text(LocaleKeys.house.tr()), findsOneWidget);
      expect(find.byIcon(Icons.house), findsOneWidget);

      // Verify battery tab
      expect(find.text(LocaleKeys.battery.tr()), findsOneWidget);
      expect(find.byIcon(Icons.battery_charging_full), findsOneWidget);
    });
  });
}
