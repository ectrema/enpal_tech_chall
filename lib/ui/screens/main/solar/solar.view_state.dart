import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:enpal_tech_chall/ui/abstraction/view_state_abs.dart';

part 'solar.view_state.g.dart';

@CopyWith()
class SolarState extends ViewStateAbs {
  final bool loading;

  const SolarState({required this.loading}) : super();

  SolarState.initial() : loading = false;

  @override
  List<Object?> get props => <Object?>[loading];
}
