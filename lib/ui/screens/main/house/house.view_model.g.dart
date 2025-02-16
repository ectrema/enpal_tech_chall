// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$houseViewModelHash() => r'a90d49e1552ab3c99228b468e92f5ce47ee652cc';

/// ViewModel for the House screen that handles the business logic and state management
/// using Riverpod for dependency injection and state management.
///
/// This class manages:
/// - House monitoring data fetching and updates
/// - Connectivity status monitoring
/// - Date selection for monitoring data
/// - Display preferences (kW vs W)
///
/// Copied from [HouseViewModel].
@ProviderFor(HouseViewModel)
final houseViewModelProvider =
    AutoDisposeNotifierProvider<HouseViewModel, HouseState>.internal(
      HouseViewModel.new,
      name: r'houseViewModelProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$houseViewModelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$HouseViewModel = AutoDisposeNotifier<HouseState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
