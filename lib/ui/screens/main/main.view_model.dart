import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:enpal_tech_chall/ui/screens/main/main.view_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.view_model.g.dart';

@riverpod
class MainViewModel extends _$MainViewModel {
  @override
  MainState build() => MainState.initial();

  (String, IconData) navBarInfo(int index) => switch (index) {
    1 => (LocaleKeys.house.tr(), Icons.house),
    2 => (LocaleKeys.battery.tr(), Icons.battery_charging_full),
    _ => (LocaleKeys.solar.tr(), Icons.solar_power),
  };

  void onItemTapped(int index, StatefulNavigationShell navigationShell) {
    state = state.copyWith(index: index);
    navigationShell.goBranch(index);
  }
}
