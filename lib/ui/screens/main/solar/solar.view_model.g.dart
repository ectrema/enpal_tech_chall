// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solar.view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$solarViewModelHash() => r'47213bd58ab8ab692edcfb4de568db01b96f30ca';

/// ViewModel for the Solar screen that handles the business logic and state management
/// using Riverpod for dependency injection and state management.
///
/// This class manages:
/// - Solar monitoring data fetching and updates
/// - Connectivity status monitoring
/// - Date selection for monitoring data
/// - Display preferences (kW vs W)
///
/// Copied from [SolarViewModel].
@ProviderFor(SolarViewModel)
final solarViewModelProvider =
    AutoDisposeNotifierProvider<SolarViewModel, SolarState>.internal(
      SolarViewModel.new,
      name: r'solarViewModelProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$solarViewModelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SolarViewModel = AutoDisposeNotifier<SolarState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
