import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:enpal_tech_chall/ui/abstraction/view_state_abs.dart';

part 'battery.view_state.g.dart';

@CopyWith()
class BatteryState extends ViewStateAbs {
  final bool loading;

  const BatteryState({required this.loading}) : super();

  BatteryState.initial() : loading = false;

  @override
  List<Object?> get props => <Object?>[loading];
}
