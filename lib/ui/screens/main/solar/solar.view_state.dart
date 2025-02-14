import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/ui/abstraction/view_state_abs.dart';

part 'solar.view_state.g.dart';

@CopyWith()
class SolarState extends ViewStateAbs {
  final bool loading;

  final List<MonitoringEntity> monitoring;

  final DateTime date;

  const SolarState({
    required this.loading,
    required this.monitoring,
    required this.date,
  }) : super();

  SolarState.initial()
    : loading = true,
      monitoring = const <MonitoringEntity>[],
      date = DateTime.now();

  @override
  List<Object?> get props => <Object?>[loading, monitoring, date];
}

extension OnMonitoringEntity on SolarState {
  Map<DateTime, double> get hourlySum {
    final Map<DateTime, double> sum = <DateTime, double>{};
    for (int i = 0; i < 24; i++) {
      if (_canAddMonitoring(i)) {
        sum[DateTime(date.year, date.month, date.day, i)] = monitoring
            .where((MonitoringEntity e) => e.date?.hour == i)
            .fold(
              0,
              (double previousValue, MonitoringEntity element) =>
                  previousValue + (element.value ?? 0),
            );
      }
    }
    return sum;
  }

  bool _canAddMonitoring(int hour) {
    return monitoring
            .firstWhere((MonitoringEntity e) => e.date?.hour == hour)
            .date
            ?.isBefore(DateTime.now()) ==
        true;
  }
}
