import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:enpal_tech_chall/core/utils/extension.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/ui/abstraction/view_state_abs.dart';

export 'package:enpal_tech_chall/core/utils/extension.dart';

part 'solar.view_state.g.dart';

/// State class for the Solar screen that holds all the UI-related state
/// including monitoring data, date selection, display preferences, and connectivity status
@CopyWith()
class SolarState extends ViewStateAbs {
  /// List of monitoring entities containing solar power generation data
  final List<MonitoringEntity> monitoring;

  /// Selected date for viewing monitoring data
  final DateTime date;

  /// Flag to determine if values should be shown in kilowatts (true) or watts (false)
  final bool showInKiloWatt;

  /// Flag indicating if the device has internet connectivity
  final bool isConnected;

  /// Creates a new instance of [SolarState] with the given parameters
  const SolarState({
    required this.monitoring,
    required this.date,
    this.showInKiloWatt = false,
    this.isConnected = true,
  }) : super();

  /// Creates an initial state with empty monitoring data and current date
  SolarState.initial(this.isConnected)
    : monitoring = const <MonitoringEntity>[],
      date = DateTime.now(),
      showInKiloWatt = true;

  @override
  List<Object?> get props => <Object?>[
    monitoring,
    date,
    showInKiloWatt,
    isConnected,
  ];
}

/// Extension methods on [SolarState] for computed properties and helper functions
extension OnSolarState on SolarState {
  /// Returns true if device is offline and no monitoring data is available
  bool get showOfflineWidget => !isConnected && monitoring.isEmpty;

  /// Calculates the total power generation by summing all monitoring values
  int get totalMonitoring =>
      monitoring.fold(0, (int a, MonitoringEntity b) => a + (b.value ?? 0));

  /// Calculates the average power generation
  /// For current date: total divided by current hour
  /// For past dates: total divided by 24 hours
  double get averageMonitoring {
    if (DateTime.now().isSameDate(date)) {
      return totalMonitoring / DateTime.now().hour;
    }
    return totalMonitoring / 24;
  }

  /// Returns the highest hourly power generation value
  /// Returns 0 if no monitoring data is available
  int get highestMonitoring {
    if (monitoring.isEmpty) return 0;

    return monitoring.hourlySum.values
        .reduce((double a, double b) => a > b ? a : b)
        .toInt();
  }

  /// Returns the lowest hourly power generation value
  /// Returns 0 if no monitoring data is available
  int get lowestMonitoring {
    if (monitoring.isEmpty) return 0;

    return monitoring.hourlySum.values
        .reduce((double a, double b) => a < b ? a : b)
        .toInt();
  }
}
