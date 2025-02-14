import 'package:enpal_tech_chall/ui/screens/main/solar/solar.view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'solar.view_model.g.dart';

///
/// [SolarViewModel]
///
@riverpod
class SolarViewModel extends _$SolarViewModel {
  factory SolarViewModel() {
    return SolarViewModel._();
  }

  SolarViewModel._();

  @override
  SolarState build() => SolarState.initial();
}
