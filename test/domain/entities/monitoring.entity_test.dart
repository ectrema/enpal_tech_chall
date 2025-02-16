import 'package:enpal_tech_chall/data/networking/responses/monitoring.model.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MonitoringEntity', () {
    test('props should contain value and date', () {
      final DateTime date = DateTime.now();
      final MonitoringEntity entity = MonitoringEntity(value: 42, date: date);

      expect(entity.props, <Object>[42, date]);
    });

    test('equals should work correctly', () {
      final DateTime date = DateTime.now();
      final MonitoringEntity entity1 = MonitoringEntity(value: 42, date: date);
      final MonitoringEntity entity2 = MonitoringEntity(value: 42, date: date);
      final MonitoringEntity entity3 = MonitoringEntity(value: 43, date: date);

      expect(entity1, equals(entity2));
      expect(entity1, isNot(equals(entity3)));
    });

    group('fromRemote', () {
      test('should create entity from valid remote model', () {
        final String timestamp = '2023-01-01T12:00:00Z';
        final MonitoringRemoteModel remoteModel = MonitoringRemoteModel(
          timestamp: timestamp,
          value: 42,
        );

        final MonitoringEntity entity = MonitoringEntity.fromRemote(
          remoteModel,
        );

        expect(entity.value, equals(42));
        expect(entity.date, equals(DateTime.parse(timestamp)));
      });

      test('should handle null values in remote model', () {
        final MonitoringRemoteModel remoteModel = MonitoringRemoteModel(
          timestamp: null,
          value: null,
        );

        final MonitoringEntity entity = MonitoringEntity.fromRemote(
          remoteModel,
        );

        expect(entity.value, isNull);
        expect(entity.date, isNull);
      });

      test('should handle invalid timestamp in remote model', () {
        final MonitoringRemoteModel remoteModel = MonitoringRemoteModel(
          timestamp: 'invalid-date',
          value: 42,
        );

        final MonitoringEntity entity = MonitoringEntity.fromRemote(
          remoteModel,
        );

        expect(entity.value, equals(42));
        expect(entity.date, isNull);
      });
    });
  });
}
