import 'package:dio/dio.dart' show DioException, DioExceptionType;
import 'package:enpal_tech_chall/core/providers/initializer.dart';
import 'package:enpal_tech_chall/core/utils/utils.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/services/monitoring.service.dart';
import 'package:enpal_tech_chall/ui/screens/main/solar/solar.view_state.dart';
import 'package:flutter/material.dart' show GlobalKey, NavigatorState;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'solar.view_model.g.dart';

///
/// [SolarViewModel]
///
@riverpod
class SolarViewModel extends _$SolarViewModel {
  final MonitoringService _monitoringService;

  factory SolarViewModel() {
    return SolarViewModel._(monitoringService: injector<MonitoringService>());
  }

  final GlobalKey<NavigatorState> scaffoldKey = GlobalKey<NavigatorState>();

  SolarViewModel._({required MonitoringService monitoringService})
    : _monitoringService = monitoringService;

  @override
  SolarState build() => SolarState.initial();

  void setListener() {
    _monitoringService.solarMonitoring.listen(
      (List<MonitoringEntity> value) {
        state = state.copyWith(monitoring: value);
      },
      onError: (Object error, StackTrace stackTrace) {
        if (scaffoldKey.currentContext != null) {
          if (error is DioException &&
              error.type == DioExceptionType.connectionError) {
            Utils.showNoInternetSnackBar(scaffoldKey.currentContext!);
          } else {
            Utils.showGenericErrorSnackBar(scaffoldKey.currentContext!);
          }
        }
      },
    );
  }

  Future<void> reloadData() async {
    await _monitoringService.getSolarMonitoring(state.date);
  }

  void setDate(DateTime date) {
    state = state.copyWith(date: date);
    _monitoringService.getSolarMonitoring(date);
  }

  void setShowInKiloWatt(bool showInKiloWatt) {
    state = state.copyWith(showInKiloWatt: showInKiloWatt);
  }
}
