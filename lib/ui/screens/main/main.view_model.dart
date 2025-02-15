import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:enpal_tech_chall/ui/screens/main/main.view_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.view_model.g.dart';

/// [MainViewModel] handles the state and logic for the main navigation screen
/// It manages the current navigation index and provides navigation bar information
@riverpod
class MainViewModel extends _$MainViewModel {
  @override
  MainState build() => MainState.initial();

  /// Returns a tuple of (String label, IconData icon) for the navigation bar item at [index]
  /// - Index 1: House screen
  /// - Index 2: Battery screen
  /// - Default: Solar screen
  (String, IconData) navBarInfo(int index) => switch (index) {
    1 => (LocaleKeys.house.tr(), Icons.house),
    2 => (LocaleKeys.battery.tr(), Icons.battery_charging_full),
    _ => (LocaleKeys.solar.tr(), Icons.solar_power),
  };

  /// Handles tapping on a navigation bar item
  /// Updates the current index in state and navigates to the corresponding branch
  void onItemTapped(int index, StatefulNavigationShell navigationShell) {
    state = state.copyWith(index: index);
    navigationShell.goBranch(index);
  }
}
