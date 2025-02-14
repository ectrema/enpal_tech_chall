import 'package:enpal_tech_chall/ui/screens/main/house/house.view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'house.view_model.g.dart';

///
/// [HouseViewModel]
///
@riverpod
class HouseViewModel extends _$HouseViewModel {
  factory HouseViewModel() {
    return HouseViewModel._();
  }

  HouseViewModel._();

  @override
  HouseState build() => HouseState.initial();
}
