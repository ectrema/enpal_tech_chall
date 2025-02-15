import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:enpal_tech_chall/ui/abstraction/view_state_abs.dart';

part 'main.view_state.g.dart';

/// [MainState] represents the state for the main navigation screen
/// It tracks the current navigation index and extends [ViewStateAbs]
@CopyWith()
class MainState extends ViewStateAbs {
  /// The current selected navigation index
  /// - 0: Solar screen
  /// - 1: House screen
  /// - 2: Battery screen
  final int index;

  /// Creates a [MainState] with the given navigation [index]
  const MainState(this.index) : super();

  /// Creates the initial state with index 0 (Solar screen)
  MainState.initial() : index = 0;

  @override
  List<Object?> get props => <Object?>[index];
}
