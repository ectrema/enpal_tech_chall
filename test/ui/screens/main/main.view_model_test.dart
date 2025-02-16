import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:enpal_tech_chall/ui/screens/main/main.view_model.dart';
import 'package:enpal_tech_chall/ui/screens/main/main.view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderContainer;
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart' show StatefulNavigationShell;
import 'package:mockito/annotations.dart' show GenerateNiceMocks, MockSpec;
import 'package:mockito/mockito.dart';

import 'main.view_model_test.mocks.dart';

// ignore: always_specify_types
@GenerateNiceMocks(<MockSpec>[MockSpec<StatefulNavigationShell>()])
void main() {
  group('MainViewModel', () {
    late MainViewModel viewModel;
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
      viewModel = container.read(mainViewModelProvider.notifier);
    });

    group('navBarInfo', () {
      test('initial state should be correct', () {
        final MainState state = container.read(mainViewModelProvider);

        expect(state.index, 0);
      });

      test('initial state should be correct', () {
        final MainState state = container.read(mainViewModelProvider);

        expect(state.index, 0);
      });
      test('returns solar info for index 0', () {
        final (String, IconData) result = viewModel.navBarInfo(0);
        expect(result.$1, equals(LocaleKeys.solar.tr()));
        expect(result.$2, equals(Icons.solar_power));
      });

      test('returns house info for index 1', () {
        final (String, IconData) result = viewModel.navBarInfo(1);
        expect(result.$1, equals(LocaleKeys.house.tr()));
        expect(result.$2, equals(Icons.house));
      });

      test('returns battery info for index 2', () {
        final (String, IconData) result = viewModel.navBarInfo(2);
        expect(result.$1, equals(LocaleKeys.battery.tr()));
        expect(result.$2, equals(Icons.battery_charging_full));
      });
    });

    group('onItemTapped', () {
      test('updates index and navigates to correct branch', () {
        final MockStatefulNavigationShell mockNavigationShell =
            MockStatefulNavigationShell();

        when(mockNavigationShell.goBranch(any)).thenReturn(null);

        viewModel.onItemTapped(1, mockNavigationShell);

        expect(viewModel.state.index, 1);
        verify(mockNavigationShell.goBranch(any)).called(1);
      });
    });
  });
}
