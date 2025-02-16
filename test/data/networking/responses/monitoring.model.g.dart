// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonitoringRemoteModel _$MonitoringRemoteModelFromJson(
  Map<String, dynamic> json,
) => MonitoringRemoteModel(
  timestamp: json['timestamp'] as String?,
  value: (json['value'] as num?)?.toInt(),
);

Map<String, dynamic> _$MonitoringRemoteModelToJson(
  MonitoringRemoteModel instance,
) => <String, dynamic>{
  'timestamp': instance.timestamp,
  'value': instance.value,
};
