import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:enpal_tech_chall/domain/services/connectivity.service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/fake_connectivity.dart';

void main() {
  late ConnectivityService connectivityService;

  group('ConnectivityService', () {
    setUp(() {
      ConnectivityPlatform.instance = FakeConnectivityWithInternet();
    });
    test('inject() initializes service with internet', () async {
      connectivityService = await ConnectivityService.inject();

      expect(connectivityService.isConnected, true);
    });

    test('isConnectedStream emits updated connectivity status', () async {
      connectivityService = await ConnectivityService.inject();

      expect(
        connectivityService.isConnectedStream,
        emitsInOrder(<bool>[
          true, // Initial state
          false, // After disconnected
          true, // After connected
        ]),
      );
    });

    test(
      'containsInternet returns correct status for different connections',
      () {
        expect(
          ConnectivityService.containsInternet(<ConnectivityResult>[
            ConnectivityResult.wifi,
          ]),
          true,
        );
        expect(
          ConnectivityService.containsInternet(<ConnectivityResult>[
            ConnectivityResult.mobile,
          ]),
          true,
        );
        expect(
          ConnectivityService.containsInternet(<ConnectivityResult>[
            ConnectivityResult.none,
          ]),
          false,
        );
        expect(
          ConnectivityService.containsInternet(<ConnectivityResult>[
            ConnectivityResult.none,
            ConnectivityResult.wifi,
          ]),
          true,
        );
      },
    );
  });

  group('isConnectedStream', () {
    setUp(() {
      ConnectivityPlatform.instance = FakeConnectivityWithoutInternet();
    });
    test('inject() initializes service without internet', () async {
      connectivityService = await ConnectivityService.inject();

      expect(connectivityService.isConnected, false);
    });
    test('isConnectedStream emits updated connectivity status', () async {
      connectivityService = await ConnectivityService.inject();

      expect(
        connectivityService.isConnectedStream,
        emitsInOrder(<bool>[
          false, // Initial state
          true, // After connected
          false, // After disconnected
        ]),
      );
    });
  });
}
