import 'package:connectivity_plus/connectivity_plus.dart'
    show Connectivity, ConnectivityResult;
import 'package:rxdart/rxdart.dart' show BehaviorSubject;

/// Service class that manages device connectivity state using RxDart's BehaviorSubject
/// for reactive state management.
///
/// This service:
/// - Maintains a stream of connectivity status (connected/disconnected)
/// - Handles connectivity changes through platform APIs
/// - Provides broadcast streams that can be listened to by multiple subscribers
final class ConnectivityService {
  /// Stream controller for connectivity status
  final BehaviorSubject<bool> _isConnected;

  /// Private constructor that initializes the service with an initial connectivity value
  /// and sets up connectivity change listeners
  ConnectivityService._({required bool initialValue})
    : _isConnected = BehaviorSubject<bool>.seeded(initialValue) {
    _initStream();
  }

  /// Public stream of connectivity status that can be listened to by subscribers
  Stream<bool> get isConnectedStream => _isConnected.stream;

  /// Current connectivity status
  bool get isConnected => _isConnected.value;

  /// Factory method to create and initialize a new instance of [ConnectivityService]
  ///
  /// Checks current connectivity status before creating the service instance
  static Future<ConnectivityService> inject() async {
    final Connectivity connectivity = Connectivity();
    final List<ConnectivityResult> result =
        await connectivity.checkConnectivity();
    return ConnectivityService._(initialValue: _containsInternet(result));
  }

  /// Initializes the connectivity change stream listener
  ///
  /// Updates the connectivity status whenever the platform reports a change
  void _initStream() {
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      _isConnected.add(_containsInternet(result));
    });
  }

  /// Helper method to determine if device has internet connectivity
  ///
  /// Returns true if device is connected to WiFi or mobile data
  static bool _containsInternet(List<ConnectivityResult> result) {
    return result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile);
  }
}
