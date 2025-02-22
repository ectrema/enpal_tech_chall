// Mocks generated by Mockito 5.4.5 from annotations
// in enpal_tech_chall/test/ui/screens/main/solar/solar.view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart' as _i4;
import 'package:enpal_tech_chall/domain/services/connectivity.service.dart'
    as _i5;
import 'package:enpal_tech_chall/domain/services/monitoring.service.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [MonitoringService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMonitoringService extends _i1.Mock implements _i2.MonitoringService {
  @override
  _i3.Stream<List<_i4.MonitoringEntity>> get solarMonitoring =>
      (super.noSuchMethod(
            Invocation.getter(#solarMonitoring),
            returnValue: _i3.Stream<List<_i4.MonitoringEntity>>.empty(),
            returnValueForMissingStub:
                _i3.Stream<List<_i4.MonitoringEntity>>.empty(),
          )
          as _i3.Stream<List<_i4.MonitoringEntity>>);

  @override
  _i3.Stream<List<_i4.MonitoringEntity>> get batteryMonitoring =>
      (super.noSuchMethod(
            Invocation.getter(#batteryMonitoring),
            returnValue: _i3.Stream<List<_i4.MonitoringEntity>>.empty(),
            returnValueForMissingStub:
                _i3.Stream<List<_i4.MonitoringEntity>>.empty(),
          )
          as _i3.Stream<List<_i4.MonitoringEntity>>);

  @override
  _i3.Stream<List<_i4.MonitoringEntity>> get houseMonitoring =>
      (super.noSuchMethod(
            Invocation.getter(#houseMonitoring),
            returnValue: _i3.Stream<List<_i4.MonitoringEntity>>.empty(),
            returnValueForMissingStub:
                _i3.Stream<List<_i4.MonitoringEntity>>.empty(),
          )
          as _i3.Stream<List<_i4.MonitoringEntity>>);

  @override
  _i3.Future<void> getSolarMonitoring(DateTime? date) =>
      (super.noSuchMethod(
            Invocation.method(#getSolarMonitoring, [date]),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  _i3.Future<void> getBatteryMonitoring(DateTime? date) =>
      (super.noSuchMethod(
            Invocation.method(#getBatteryMonitoring, [date]),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  _i3.Future<void> getHouseMonitoring(DateTime? date) =>
      (super.noSuchMethod(
            Invocation.method(#getHouseMonitoring, [date]),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);
}

/// A class which mocks [ConnectivityService].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectivityService extends _i1.Mock
    implements _i5.ConnectivityService {
  @override
  _i3.Stream<bool> get isConnectedStream =>
      (super.noSuchMethod(
            Invocation.getter(#isConnectedStream),
            returnValue: _i3.Stream<bool>.empty(),
            returnValueForMissingStub: _i3.Stream<bool>.empty(),
          )
          as _i3.Stream<bool>);

  @override
  bool get isConnected =>
      (super.noSuchMethod(
            Invocation.getter(#isConnected),
            returnValue: false,
            returnValueForMissingStub: false,
          )
          as bool);
}
