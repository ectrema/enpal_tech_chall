// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solar.view_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SolarStateCWProxy {
  SolarState loading(bool loading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SolarState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SolarState(...).copyWith(id: 12, name: "My name")
  /// ````
  SolarState call({bool loading});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSolarState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSolarState.copyWith.fieldName(...)`
class _$SolarStateCWProxyImpl implements _$SolarStateCWProxy {
  const _$SolarStateCWProxyImpl(this._value);

  final SolarState _value;

  @override
  SolarState loading(bool loading) => this(loading: loading);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SolarState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SolarState(...).copyWith(id: 12, name: "My name")
  /// ````
  SolarState call({Object? loading = const $CopyWithPlaceholder()}) {
    return SolarState(
      loading:
          loading == const $CopyWithPlaceholder()
              ? _value.loading
              // ignore: cast_nullable_to_non_nullable
              : loading as bool,
    );
  }
}

extension $SolarStateCopyWith on SolarState {
  /// Returns a callable class that can be used as follows: `instanceOfSolarState.copyWith(...)` or like so:`instanceOfSolarState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SolarStateCWProxy get copyWith => _$SolarStateCWProxyImpl(this);
}
