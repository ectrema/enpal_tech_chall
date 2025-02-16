import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class FakeConnectivityWithInternet extends Mock
    with MockPlatformInterfaceMixin
    implements ConnectivityPlatform {
  @override
  Future<List<ConnectivityResult>> checkConnectivity() async {
    return <ConnectivityResult>[ConnectivityResult.wifi];
  }

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      Stream<List<ConnectivityResult>>.fromIterable(<List<ConnectivityResult>>[
        <ConnectivityResult>[ConnectivityResult.none],
        <ConnectivityResult>[ConnectivityResult.wifi],
      ]);
}

class FakeConnectivityWithoutInternet extends Mock
    with MockPlatformInterfaceMixin
    implements ConnectivityPlatform {
  @override
  Future<List<ConnectivityResult>> checkConnectivity() async {
    return <ConnectivityResult>[ConnectivityResult.none];
  }

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      Stream<List<ConnectivityResult>>.fromIterable(<List<ConnectivityResult>>[
        <ConnectivityResult>[ConnectivityResult.wifi],
        <ConnectivityResult>[ConnectivityResult.none],
      ]);
}
