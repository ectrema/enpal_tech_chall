import 'package:enpal_tech_chall/core/enums/energy_type.enum.dart';
import 'package:enpal_tech_chall/data/monitoring/remote/monitoring.remote.data_source.dart';
import 'package:enpal_tech_chall/data/networking/responses/monitoring.model.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/domain/repositories/monitoring.repository.dart';

/// [MonitoringRepositoryImpl]
interface class MonitoringRepositoryImpl implements MonitoringRepository {
  final MonitoringRemoteDataSource _remoteDataSource;

  MonitoringRepositoryImpl({
    required MonitoringRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<List<MonitoringEntity>> getMonitoring({
    required DateTime date,
    required EnergyType energyType,
  }) async {
    final List<MonitoringRemoteModel> remoteModel = await _remoteDataSource
        .getMonitoring(date: date, energyType: energyType);
    return remoteModel.map(MonitoringEntity.fromRemote).toList();
  }
}
