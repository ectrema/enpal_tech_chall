import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/ui/abstraction/view_state_abs.dart';

export 'package:enpal_tech_chall/core/utils/extension.dart';

part 'battery.view_state.g.dart';

@CopyWith()
class BatteryState extends ViewStateAbs {
  final List<MonitoringEntity> monitoring;

  final DateTime date;

  final bool showInKiloWatt;

  const BatteryState({
    required this.monitoring,
    required this.date,
    this.showInKiloWatt = false,
  }) : super();

  BatteryState.initial()
    : monitoring = const <MonitoringEntity>[],
      date = DateTime.now(),
      showInKiloWatt = false;

  @override
  List<Object?> get props => <Object?>[monitoring, date, showInKiloWatt];
}
