import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:enpal_tech_chall/domain/entities/monitoring.entity.dart';
import 'package:enpal_tech_chall/ui/abstraction/view_state_abs.dart';

export 'package:enpal_tech_chall/core/utils/extension.dart';

part 'house.view_state.g.dart';

@CopyWith()
class HouseState extends ViewStateAbs {
  final List<MonitoringEntity> monitoring;

  final DateTime date;

  const HouseState({required this.monitoring, required this.date}) : super();

  HouseState.initial()
    : monitoring = const <MonitoringEntity>[],
      date = DateTime.now();

  @override
  List<Object?> get props => <Object?>[monitoring, date];
}
