import 'package:dio/dio.dart' show DioException, DioExceptionType;
import 'package:enpal_tech_chall/core/providers/initializer.dart';
import 'package:enpal_tech_chall/core/utils/utils.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/services/connectivity.service.dart';
import 'package:enpal_tech_chall/domain/services/monitoring.service.dart';
import 'package:enpal_tech_chall/ui/screens/main/battery/battery.view_state.dart';
import 'package:flutter/material.dart' show GlobalKey, NavigatorState;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'battery.view_model.g.dart';

/// ViewModel for the Battery screen that handles the business logic and state management
/// using Riverpod for dependency injection and state management.
///
/// This class manages:
/// - Battery monitoring data fetching and updates
/// - Connectivity status monitoring
/// - Date selection for monitoring data
/// - Display preferences (kW vs W)
@riverpod
class BatteryViewModel extends _$BatteryViewModel {
  /// Service for handling battery monitoring data operations
  final MonitoringService _monitoringService;

  /// Service for monitoring device connectivity status
  final ConnectivityService _connectivityService;

  /// Factory constructor that initializes the required services using dependency injection
  factory BatteryViewModel() {
    return BatteryViewModel._(
      monitoringService: injector<MonitoringService>(),
      connectivityService: injector<ConnectivityService>(),
    );
  }

  /// Global key for accessing the scaffold state, used for showing snackbars
  final GlobalKey<NavigatorState> scaffoldKey = GlobalKey<NavigatorState>();

  /// Private constructor that initializes services and sets up connectivity listener
  BatteryViewModel._({
    required MonitoringService monitoringService,
    required ConnectivityService connectivityService,
  }) : _monitoringService = monitoringService,
       _connectivityService = connectivityService;

  @override
  BatteryState build() =>
      BatteryState.initial(_connectivityService.isConnected);

  /// Sets up a listener for connectivity changes and updates the state accordingly
  void _connectivityListener() {
    _connectivityService.isConnectedStream.listen((bool isConnected) {
      if (isConnected == state.isConnected) return;
      state = state.copyWith(isConnected: isConnected);

      if (isConnected && state.monitoring.isEmpty) {
        _monitoringService.getBatteryMonitoring(state.date);
      }
    });
  }

  /// Sets up a listener for battery monitoring data updates and error handling
  void setListener() {
    _monitoringService.batteryMonitoring.listen(
      (List<MonitoringEntity> value) {
        state = state.copyWith(monitoring: value);
      },
      onError: (Object error, StackTrace stackTrace) {
        if (scaffoldKey.currentContext != null) {
          if (error is DioException &&
              error.type == DioExceptionType.connectionError &&
              !state.isConnected) {
            Utils.showNoInternetSnackBar(scaffoldKey.currentContext!);
          } else {
            Utils.showGenericErrorSnackBar(scaffoldKey.currentContext!);
          }
        }
      },
    );
    _connectivityListener();
  }

  /// Reloads the battery monitoring data for the current date
  Future<void> reloadData() async {
    await _monitoringService.getBatteryMonitoring(state.date);
  }

  /// Updates the selected date and fetches new monitoring data
  void setDate(DateTime date) {
    state = state.copyWith(date: date, monitoring: <MonitoringEntity>[]);
    _monitoringService.getBatteryMonitoring(date);
  }

  /// Toggles between kilowatt and watt display units
  void setShowInKiloWatt(bool showInKiloWatt) {
    state = state.copyWith(showInKiloWatt: showInKiloWatt);
  }
}
