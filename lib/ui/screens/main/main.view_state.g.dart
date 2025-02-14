// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.view_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MainStateCWProxy {
  MainState index(int index);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MainState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MainState(...).copyWith(id: 12, name: "My name")
  /// ````
  MainState call({int index});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMainState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMainState.copyWith.fieldName(...)`
class _$MainStateCWProxyImpl implements _$MainStateCWProxy {
  const _$MainStateCWProxyImpl(this._value);

  final MainState _value;

  @override
  MainState index(int index) => this(index: index);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MainState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MainState(...).copyWith(id: 12, name: "My name")
  /// ````
  MainState call({Object? index = const $CopyWithPlaceholder()}) {
    return MainState(
      index == const $CopyWithPlaceholder()
          ? _value.index
          // ignore: cast_nullable_to_non_nullable
          : index as int,
    );
  }
}

extension $MainStateCopyWith on MainState {
  /// Returns a callable class that can be used as follows: `instanceOfMainState.copyWith(...)` or like so:`instanceOfMainState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MainStateCWProxy get copyWith => _$MainStateCWProxyImpl(this);
}
