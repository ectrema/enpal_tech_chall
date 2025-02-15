import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:enpal_tech_chall/core/utils/extension.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/ui/abstraction/view_state_abs.dart';

export 'package:enpal_tech_chall/core/utils/extension.dart';

part 'battery.view_state.g.dart';

/// State class for the Battery screen that holds all the UI-related state
/// including monitoring data, date selection, display preferences, and connectivity status
@CopyWith()
class BatteryState extends ViewStateAbs {
  /// List of monitoring entities containing battery power data
  final List<MonitoringEntity> monitoring;

  /// Selected date for viewing monitoring data
  final DateTime date;

  /// Flag to determine if values should be shown in kilowatts (true) or watts (false)
  final bool showInKiloWatt;

  /// Flag indicating if the device has internet connectivity
  final bool isConnected;

  /// Creates a new instance of [BatteryState] with the given parameters
  const BatteryState({
    required this.monitoring,
    required this.date,
    this.showInKiloWatt = false,
    this.isConnected = true,
  }) : super();

  /// Creates an initial state with empty monitoring data and current date
  BatteryState.initial(this.isConnected)
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

/// Extension methods on [BatteryState] for computed properties and helper functions
extension OnBatteryState on BatteryState {
  /// Returns true if device is offline and no monitoring data is available
  bool get showOfflineWidget => !isConnected && monitoring.isEmpty;

  /// Calculates the total battery power by summing all monitoring values
  int get totalMonitoring =>
      monitoring.fold(0, (int a, MonitoringEntity b) => a + (b.value ?? 0));

  /// Calculates the average battery power
  /// For current date: total divided by current hour
  /// For past dates: total divided by 24 hours
  double get averageMonitoring {
    if (DateTime.now().isSameDate(date)) {
      return totalMonitoring / DateTime.now().hour;
    }
    return totalMonitoring / 24;
  }

  /// Returns the highest hourly battery power value
  /// Returns 0 if no monitoring data is available
  int get highestMonitoring {
    if (monitoring.isEmpty) return 0;

    return monitoring.hourlySum.values
        .reduce((double a, double b) => a > b ? a : b)
        .toInt();
  }

  /// Returns the lowest hourly battery power value
  /// Returns 0 if no monitoring data is available
  int get lowestMonitoring {
    if (monitoring.isEmpty) return 0;

    return monitoring.hourlySum.values
        .reduce((double a, double b) => a < b ? a : b)
        .toInt();
  }
}
