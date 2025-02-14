import 'package:enpal_tech_chall/ui/screens/main/battery/battery.view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'battery.view_model.g.dart';

///
/// [BatteryViewModel]
///
@riverpod
class BatteryViewModel extends _$BatteryViewModel {
  factory BatteryViewModel() {
    return BatteryViewModel._();
  }

  BatteryViewModel._();

  @override
  BatteryState build() => BatteryState.initial();
}
