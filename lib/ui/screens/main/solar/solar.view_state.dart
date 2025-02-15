import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/ui/abstraction/view_state_abs.dart';

export 'package:enpal_tech_chall/core/utils/extension.dart';

part 'solar.view_state.g.dart';

@CopyWith()
class SolarState extends ViewStateAbs {
  final List<MonitoringEntity> monitoring;

  final DateTime date;

  final bool showInKiloWatt;

  const SolarState({
    required this.monitoring,
    required this.date,
    this.showInKiloWatt = false,
  }) : super();

  SolarState.initial()
    : monitoring = const <MonitoringEntity>[],
      date = DateTime.now(),
      showInKiloWatt = false;

  @override
  List<Object?> get props => <Object?>[monitoring, date, showInKiloWatt];
}
