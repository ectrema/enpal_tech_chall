// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery.view_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BatteryStateCWProxy {
  BatteryState monitoring(List<MonitoringEntity> monitoring);

  BatteryState date(DateTime date);

  BatteryState showInKiloWatt(bool showInKiloWatt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BatteryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BatteryState(...).copyWith(id: 12, name: "My name")
  /// ````
  BatteryState call({
    List<MonitoringEntity> monitoring,
    DateTime date,
    bool showInKiloWatt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBatteryState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBatteryState.copyWith.fieldName(...)`
class _$BatteryStateCWProxyImpl implements _$BatteryStateCWProxy {
  const _$BatteryStateCWProxyImpl(this._value);

  final BatteryState _value;

  @override
  BatteryState monitoring(List<MonitoringEntity> monitoring) =>
      this(monitoring: monitoring);

  @override
  BatteryState date(DateTime date) => this(date: date);

  @override
  BatteryState showInKiloWatt(bool showInKiloWatt) =>
      this(showInKiloWatt: showInKiloWatt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BatteryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BatteryState(...).copyWith(id: 12, name: "My name")
  /// ````
  BatteryState call({
    Object? monitoring = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? showInKiloWatt = const $CopyWithPlaceholder(),
  }) {
    return BatteryState(
      monitoring:
          monitoring == const $CopyWithPlaceholder()
              ? _value.monitoring
              // ignore: cast_nullable_to_non_nullable
              : monitoring as List<MonitoringEntity>,
      date:
          date == const $CopyWithPlaceholder()
              ? _value.date
              // ignore: cast_nullable_to_non_nullable
              : date as DateTime,
      showInKiloWatt:
          showInKiloWatt == const $CopyWithPlaceholder()
              ? _value.showInKiloWatt
              // ignore: cast_nullable_to_non_nullable
              : showInKiloWatt as bool,
    );
  }
}

extension $BatteryStateCopyWith on BatteryState {
  /// Returns a callable class that can be used as follows: `instanceOfBatteryState.copyWith(...)` or like so:`instanceOfBatteryState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BatteryStateCWProxy get copyWith => _$BatteryStateCWProxyImpl(this);
}
