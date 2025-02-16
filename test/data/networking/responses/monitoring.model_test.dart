import 'package:enpal_tech_chall/data/networking/responses/monitoring.model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MonitoringRemoteModel', () {
    test('should create model from json', () {
      // Arrange
      final Map<String, dynamic> json = <String, dynamic>{
        'timestamp': '2024-01-01T00:00:00Z',
        'value': 100,
      };

      // Act
      final MonitoringRemoteModel model = MonitoringRemoteModel.fromJson(json);

      // Assert
      expect(model.timestamp, equals('2024-01-01T00:00:00Z'));
      expect(model.value, equals(100));
    });

    test('should handle null values', () {
      // Arrange
      final Map<String, dynamic> json = <String, dynamic>{
        'timestamp': null,
        'value': null,
      };

      // Act
      final MonitoringRemoteModel model = MonitoringRemoteModel.fromJson(json);

      // Assert
      expect(model.timestamp, isNull);
      expect(model.value, isNull);
    });

    test('should create model with constructor', () {
      // Act
      final MonitoringRemoteModel model = MonitoringRemoteModel(
        timestamp: '2024-01-01T00:00:00Z',
        value: 100,
      );

      // Assert
      expect(model.timestamp, equals('2024-01-01T00:00:00Z'));
      expect(model.value, equals(100));
    });
  });
}
