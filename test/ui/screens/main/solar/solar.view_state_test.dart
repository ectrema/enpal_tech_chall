import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/ui/screens/main/solar/solar.view_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SolarState', () {
    test('initial state has empty monitoring and current date', () {
      final SolarState state = SolarState.initial(true);
      expect(state.monitoring, isEmpty);
      expect(state.date.day, equals(DateTime.now().day));
      expect(state.showInKiloWatt, isTrue);
      expect(state.isConnected, isTrue);
    });

    test('constructor sets all properties', () {
      final DateTime date = DateTime(2023);
      final List<MonitoringEntity> monitoring = <MonitoringEntity>[
        MonitoringEntity(value: 100, date: DateTime.now()),
      ];
      final SolarState state = SolarState(
        monitoring: monitoring,
        date: date,
        showInKiloWatt: true,
        isConnected: false,
      );

      expect(state.monitoring, equals(monitoring));
      expect(state.date, equals(date));
      expect(state.showInKiloWatt, isTrue);
      expect(state.isConnected, isFalse);
    });

    test('props contains all properties', () {
      final DateTime date = DateTime(2023);
      final List<MonitoringEntity> monitoring = <MonitoringEntity>[
        MonitoringEntity(value: 100, date: DateTime.now()),
      ];
      final SolarState state = SolarState(
        monitoring: monitoring,
        date: date,
        showInKiloWatt: true,
        isConnected: false,
      );

      expect(state.props, equals(<Object?>[monitoring, date, true, false]));
    });

    group('OnSolarState extension', () {
      test('showOfflineWidget returns true when offline with no data', () {
        final SolarState state = SolarState(
          monitoring: const <MonitoringEntity>[],
          date: DateTime.now(),
          isConnected: false,
        );
        expect(state.showOfflineWidget, isTrue);
      });

      test('totalMonitoring sums all monitoring values', () {
        final SolarState state = SolarState(
          monitoring: <MonitoringEntity>[
            MonitoringEntity(value: 100, date: DateTime.now()),
            MonitoringEntity(value: 200, date: DateTime.now()),
          ],
          date: DateTime.now(),
        );
        expect(state.totalMonitoring, equals(300));
      });

      test('averageMonitoring calculates correctly for current date', () {
        final DateTime now = DateTime.now();
        final SolarState state = SolarState(
          monitoring: <MonitoringEntity>[
            MonitoringEntity(value: 100, date: now),
            MonitoringEntity(value: 200, date: now),
          ],
          date: now,
        );
        expect(state.averageMonitoring, equals(300 / now.hour));
      });

      test('averageMonitoring calculates correctly for past date', () {
        final SolarState state = SolarState(
          monitoring: <MonitoringEntity>[
            MonitoringEntity(value: 100, date: DateTime.now()),
            MonitoringEntity(value: 200, date: DateTime.now()),
          ],
          date: DateTime(2023),
        );
        expect(state.averageMonitoring, equals(300 / 24));
      });

      test('highestMonitoring returns highest hourly value', () {
        final DateTime now = DateTime.now();
        final SolarState state = SolarState(
          monitoring: <MonitoringEntity>[
            MonitoringEntity(value: 100, date: now),
            MonitoringEntity(value: 200, date: now),
            MonitoringEntity(
              value: 300,
              date: now.subtract(const Duration(hours: 1)),
            ),
            MonitoringEntity(
              value: 400,
              date: now.subtract(const Duration(hours: 1)),
            ),
          ],
          date: now,
        );
        expect(state.highestMonitoring, equals(700));
      });

      test('lowestMonitoring returns lowest hourly value', () {
        final DateTime now = DateTime.now();
        final SolarState state = SolarState(
          monitoring: <MonitoringEntity>[
            MonitoringEntity(value: 100, date: now),
            MonitoringEntity(value: 200, date: now),
            MonitoringEntity(
              value: 300,
              date: now.subtract(const Duration(hours: 1)),
            ),
            MonitoringEntity(
              value: 400,
              date: now.subtract(const Duration(hours: 1)),
            ),
          ],
          date: now,
        );
        expect(state.lowestMonitoring, equals(300));
      });

      test('highestMonitoring returns 0 for empty monitoring', () {
        final SolarState state = SolarState(
          monitoring: const <MonitoringEntity>[],
          date: DateTime.now(),
        );
        expect(state.highestMonitoring, equals(0));
      });

      test('lowestMonitoring returns 0 for empty monitoring', () {
        final SolarState state = SolarState(
          monitoring: const <MonitoringEntity>[],
          date: DateTime.now(),
        );
        expect(state.lowestMonitoring, equals(0));
      });
    });
  });
}
