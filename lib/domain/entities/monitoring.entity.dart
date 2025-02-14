import 'package:enpal_tech_chall/data/networking/responses/monitoring.model.dart';
import 'package:equatable/equatable.dart';

final class MonitoringEntity with EquatableMixin {
  final int? value;
  final DateTime? date;

  MonitoringEntity({required this.value, required this.date});

  @override
  List<Object?> get props => <Object?>[value, date];

  factory MonitoringEntity.fromRemote(MonitoringRemoteModel remoteModel) {
    return MonitoringEntity(
      value: remoteModel.value,
      date: DateTime.tryParse(remoteModel.timestamp ?? ''),
    );
  }
}
