// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.view_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HouseStateCWProxy {
  HouseState monitoring(List<MonitoringEntity> monitoring);

  HouseState date(DateTime date);

  HouseState showInKiloWatt(bool showInKiloWatt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HouseState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HouseState(...).copyWith(id: 12, name: "My name")
  /// ````
  HouseState call({
    List<MonitoringEntity> monitoring,
    DateTime date,
    bool showInKiloWatt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHouseState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHouseState.copyWith.fieldName(...)`
class _$HouseStateCWProxyImpl implements _$HouseStateCWProxy {
  const _$HouseStateCWProxyImpl(this._value);

  final HouseState _value;

  @override
  HouseState monitoring(List<MonitoringEntity> monitoring) =>
      this(monitoring: monitoring);

  @override
  HouseState date(DateTime date) => this(date: date);

  @override
  HouseState showInKiloWatt(bool showInKiloWatt) =>
      this(showInKiloWatt: showInKiloWatt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HouseState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HouseState(...).copyWith(id: 12, name: "My name")
  /// ````
  HouseState call({
    Object? monitoring = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? showInKiloWatt = const $CopyWithPlaceholder(),
  }) {
    return HouseState(
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

extension $HouseStateCopyWith on HouseState {
  /// Returns a callable class that can be used as follows: `instanceOfHouseState.copyWith(...)` or like so:`instanceOfHouseState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HouseStateCWProxy get copyWith => _$HouseStateCWProxyImpl(this);
}
