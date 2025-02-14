// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.view_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HouseStateCWProxy {
  HouseState loading(bool loading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HouseState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HouseState(...).copyWith(id: 12, name: "My name")
  /// ````
  HouseState call({bool loading});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHouseState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHouseState.copyWith.fieldName(...)`
class _$HouseStateCWProxyImpl implements _$HouseStateCWProxy {
  const _$HouseStateCWProxyImpl(this._value);

  final HouseState _value;

  @override
  HouseState loading(bool loading) => this(loading: loading);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HouseState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HouseState(...).copyWith(id: 12, name: "My name")
  /// ````
  HouseState call({Object? loading = const $CopyWithPlaceholder()}) {
    return HouseState(
      loading:
          loading == const $CopyWithPlaceholder()
              ? _value.loading
              // ignore: cast_nullable_to_non_nullable
              : loading as bool,
    );
  }
}

extension $HouseStateCopyWith on HouseState {
  /// Returns a callable class that can be used as follows: `instanceOfHouseState.copyWith(...)` or like so:`instanceOfHouseState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HouseStateCWProxy get copyWith => _$HouseStateCWProxyImpl(this);
}
