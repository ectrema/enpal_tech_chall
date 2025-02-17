// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery.view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$batteryViewModelHash() => r'17ca4f6998e16d8ebb0f5a392472bfb952cd1ade';

/// ViewModel for the Battery screen that handles the business logic and state management
/// using Riverpod for dependency injection and state management.
///
/// This class manages:
/// - Battery monitoring data fetching and updates
/// - Connectivity status monitoring
/// - Date selection for monitoring data
/// - Display preferences (kW vs W)
///
/// Copied from [BatteryViewModel].
@ProviderFor(BatteryViewModel)
final batteryViewModelProvider =
    AutoDisposeNotifierProvider<BatteryViewModel, BatteryState>.internal(
      BatteryViewModel.new,
      name: r'batteryViewModelProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$batteryViewModelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BatteryViewModel = AutoDisposeNotifier<BatteryState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
