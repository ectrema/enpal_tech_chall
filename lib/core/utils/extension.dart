import 'package:collection/collection.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';

/// Extension on List<[MonitoringEntity]> to add hourly sum functionality
extension OnListMonitoring on List<MonitoringEntity> {
  /// Returns a map of DateTime to double representing hourly sums of monitoring values
  /// The map contains entries for each hour of the current day up to the current time
  /// If the list is empty, returns an empty map
  Map<DateTime, double> get hourlySum {
    if (isEmpty) return <DateTime, double>{};

    final DateTime date = DateTime.now();
    final Map<DateTime, double> sum = <DateTime, double>{};

    // Iterate through 24 hours of the day
    for (int i = 0; i < 24; i++) {
      // Only add monitoring data for valid hours
      if (_canAddMonitoring(i)) {
        // Create DateTime key for this hour and calculate sum of values
        sum[DateTime(date.year, date.month, date.day, i)] = where(
          // Filter monitoring entries for current hour that are before now
          (MonitoringEntity e) =>
              e.date?.hour == i && e.date?.isBefore(DateTime.now()) == true,
        ).fold(
          0,
          // Sum up all values, using 0 for null values
          (double previousValue, MonitoringEntity element) =>
              previousValue + (element.value ?? 0),
        );
      }
    }
    return sum;
  }

  /// Checks if monitoring data can be added for a given hour
  /// Returns true if there is monitoring data for that hour and it's before current time
  bool _canAddMonitoring(int hour) {
    return firstWhereOrNull(
          (MonitoringEntity e) => e.date?.hour == hour,
        )?.date?.isBefore(DateTime.now()) ==
        true;
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
