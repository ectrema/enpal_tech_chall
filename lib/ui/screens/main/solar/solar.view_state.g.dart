// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solar.view_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SolarStateCWProxy {
  SolarState monitoring(List<MonitoringEntity> monitoring);

  SolarState date(DateTime date);

  SolarState showInKiloWatt(bool showInKiloWatt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SolarState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SolarState(...).copyWith(id: 12, name: "My name")
  /// ````
  SolarState call({
    List<MonitoringEntity> monitoring,
    DateTime date,
    bool showInKiloWatt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSolarState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSolarState.copyWith.fieldName(...)`
class _$SolarStateCWProxyImpl implements _$SolarStateCWProxy {
  const _$SolarStateCWProxyImpl(this._value);

  final SolarState _value;

  @override
  SolarState monitoring(List<MonitoringEntity> monitoring) =>
      this(monitoring: monitoring);

  @override
  SolarState date(DateTime date) => this(date: date);

  @override
  SolarState showInKiloWatt(bool showInKiloWatt) =>
      this(showInKiloWatt: showInKiloWatt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SolarState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SolarState(...).copyWith(id: 12, name: "My name")
  /// ````
  SolarState call({
    Object? monitoring = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? showInKiloWatt = const $CopyWithPlaceholder(),
  }) {
    return SolarState(
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

extension $SolarStateCopyWith on SolarState {
  /// Returns a callable class that can be used as follows: `instanceOfSolarState.copyWith(...)` or like so:`instanceOfSolarState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SolarStateCWProxy get copyWith => _$SolarStateCWProxyImpl(this);
}
