import 'package:json_annotation/json_annotation.dart';

part 'monitoring.model.g.dart';

///
/// [MonitoringRemoteModel]
///
@JsonSerializable(fieldRename: FieldRename.snake)
class MonitoringRemoteModel {
  final String? timestamp;
  final int? value;

  MonitoringRemoteModel({required this.timestamp, required this.value});

  factory MonitoringRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$MonitoringRemoteModelFromJson(json);
}
