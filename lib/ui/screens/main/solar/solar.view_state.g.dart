// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solar.view_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SolarStateCWProxy {
  SolarState loading(bool loading);

  SolarState monitoring(List<MonitoringEntity> monitoring);

  SolarState date(DateTime date);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SolarState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SolarState(...).copyWith(id: 12, name: "My name")
  /// ````
  SolarState call({
    bool loading,
    List<MonitoringEntity> monitoring,
    DateTime date,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSolarState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSolarState.copyWith.fieldName(...)`
class _$SolarStateCWProxyImpl implements _$SolarStateCWProxy {
  const _$SolarStateCWProxyImpl(this._value);

  final SolarState _value;

  @override
  SolarState loading(bool loading) => this(loading: loading);

  @override
  SolarState monitoring(List<MonitoringEntity> monitoring) =>
      this(monitoring: monitoring);

  @override
  SolarState date(DateTime date) => this(date: date);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SolarState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SolarState(...).copyWith(id: 12, name: "My name")
  /// ````
  SolarState call({
    Object? loading = const $CopyWithPlaceholder(),
    Object? monitoring = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
  }) {
    return SolarState(
      loading:
          loading == const $CopyWithPlaceholder()
              ? _value.loading
              // ignore: cast_nullable_to_non_nullable
              : loading as bool,
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
    );
  }
}

extension $SolarStateCopyWith on SolarState {
  /// Returns a callable class that can be used as follows: `instanceOfSolarState.copyWith(...)` or like so:`instanceOfSolarState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SolarStateCWProxy get copyWith => _$SolarStateCWProxyImpl(this);
}
