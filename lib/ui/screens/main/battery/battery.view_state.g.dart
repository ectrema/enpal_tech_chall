// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery.view_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BatteryStateCWProxy {
  BatteryState loading(bool loading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BatteryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BatteryState(...).copyWith(id: 12, name: "My name")
  /// ````
  BatteryState call({bool loading});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBatteryState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBatteryState.copyWith.fieldName(...)`
class _$BatteryStateCWProxyImpl implements _$BatteryStateCWProxy {
  const _$BatteryStateCWProxyImpl(this._value);

  final BatteryState _value;

  @override
  BatteryState loading(bool loading) => this(loading: loading);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BatteryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BatteryState(...).copyWith(id: 12, name: "My name")
  /// ````
  BatteryState call({Object? loading = const $CopyWithPlaceholder()}) {
    return BatteryState(
      loading:
          loading == const $CopyWithPlaceholder()
              ? _value.loading
              // ignore: cast_nullable_to_non_nullable
              : loading as bool,
    );
  }
}

extension $BatteryStateCopyWith on BatteryState {
  /// Returns a callable class that can be used as follows: `instanceOfBatteryState.copyWith(...)` or like so:`instanceOfBatteryState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BatteryStateCWProxy get copyWith => _$BatteryStateCWProxyImpl(this);
}
