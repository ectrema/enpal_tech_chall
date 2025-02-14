import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';

extension OnListMonitoring on List<MonitoringEntity> {
  Map<DateTime, double> get hourlySum {
    if (isEmpty) return <DateTime, double>{};

    final DateTime date = DateTime.now();
    final Map<DateTime, double> sum = <DateTime, double>{};
    for (int i = 0; i < 24; i++) {
      if (_canAddMonitoring(i)) {
        sum[DateTime(date.year, date.month, date.day, i)] = where(
          (MonitoringEntity e) =>
              e.date?.hour == i && e.date?.isBefore(DateTime.now()) == true,
        ).fold(
          0,
          (double previousValue, MonitoringEntity element) =>
              previousValue + (element.value ?? 0),
        );
      }
    }
    return sum;
  }

  bool _canAddMonitoring(int hour) {
    return firstWhere(
          (MonitoringEntity e) => e.date?.hour == hour,
        ).date?.isBefore(DateTime.now()) ==
        true;
  }
}
