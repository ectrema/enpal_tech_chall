import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:enpal_tech_chall/ui/abstraction/view_state_abs.dart';

part 'house.view_state.g.dart';

@CopyWith()
class HouseState extends ViewStateAbs {
  final bool loading;

  const HouseState({required this.loading}) : super();

  HouseState.initial() : loading = false;

  @override
  List<Object?> get props => <Object?>[loading];
}
