import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:enpal_tech_chall/core/utils/extension.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/ui/abstraction/view_state_abs.dart';

export 'package:enpal_tech_chall/core/utils/extension.dart';

part 'solar.view_state.g.dart';

@CopyWith()
class SolarState extends ViewStateAbs {
  final List<MonitoringEntity> monitoring;

  final DateTime date;

  final bool showInKiloWatt;

  final bool isConnected;

  const SolarState({
    required this.monitoring,
    required this.date,
    this.showInKiloWatt = false,
    this.isConnected = true,
  }) : super();

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

extension OnSolarState on SolarState {
  bool get showOfflineWidget => !isConnected && monitoring.isEmpty;

  int get totalMonitoring =>
      monitoring.fold(0, (int a, MonitoringEntity b) => a + (b.value ?? 0));

  double get averageMonitoring {
    if (DateTime.now().isSameDate(date)) {
      return totalMonitoring / DateTime.now().hour;
    }
    return totalMonitoring / 24;
  }
}
