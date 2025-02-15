import 'package:enpal_tech_chall/data/networking/responses/monitoring.model.dart';
import 'package:equatable/equatable.dart';

/// Entity class representing monitoring data with value and timestamp
///
/// This entity:
/// - Stores monitoring value and date information
/// - Implements equality comparison using Equatable
/// - Provides factory method to create entity from remote model
final class MonitoringEntity with EquatableMixin {
  /// The monitoring value measurement
  final int? value;

  /// Timestamp of when the monitoring data was recorded
  final DateTime? date;

  /// Creates a new instance of [MonitoringEntity]
  ///
  /// Parameters:
  /// - [value]: The monitoring value measurement
  /// - [date]: Timestamp of the measurement
  MonitoringEntity({required this.value, required this.date});

  @override
  List<Object?> get props => <Object?>[value, date];

  /// Creates a [MonitoringEntity] from a remote data model
  ///
  /// Converts [MonitoringRemoteModel] to entity by:
  /// - Mapping value directly
  /// - Parsing timestamp string to DateTime
  factory MonitoringEntity.fromRemote(MonitoringRemoteModel remoteModel) {
    return MonitoringEntity(
      value: remoteModel.value,
      date: DateTime.tryParse(remoteModel.timestamp ?? ''),
    );
  }
}
