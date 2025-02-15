import 'package:connectivity_plus/connectivity_plus.dart'
    show Connectivity, ConnectivityResult;
import 'package:rxdart/rxdart.dart' show BehaviorSubject;

final class ConnectivityService {
  final BehaviorSubject<bool> _isConnected;

  ConnectivityService._({required bool initialValue})
    : _isConnected = BehaviorSubject<bool>.seeded(initialValue) {
    _initStream();
  }

  Stream<bool> get isConnectedStream => _isConnected.stream;

  bool get isConnected => _isConnected.value;

  static Future<ConnectivityService> inject() async {
    final Connectivity connectivity = Connectivity();
    final List<ConnectivityResult> result =
        await connectivity.checkConnectivity();
    return ConnectivityService._(initialValue: _containsInternet(result));
  }

  void _initStream() {
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      _isConnected.add(_containsInternet(result));
    });
  }

  static bool _containsInternet(List<ConnectivityResult> result) {
    return result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile);
  }
}
