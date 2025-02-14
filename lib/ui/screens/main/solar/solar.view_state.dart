import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/ui/abstraction/view_state_abs.dart';

part 'solar.view_state.g.dart';

@CopyWith()
class SolarState extends ViewStateAbs {
  final bool loading;

  final List<MonitoringEntity> monitoring;

  const SolarState({required this.loading, required this.monitoring}) : super();

  SolarState.initial()
    : loading = false,
      monitoring = const <MonitoringEntity>[];

  @override
  List<Object?> get props => <Object?>[loading, monitoring];
}
