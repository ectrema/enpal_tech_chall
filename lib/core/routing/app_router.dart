// coverage:ignore-file

import 'package:enpal_tech_chall/core/enums/router.enum.dart';
import 'package:enpal_tech_chall/ui/screens/main/battery/battery.screen.dart';
import 'package:enpal_tech_chall/ui/screens/main/house/house.screen.dart';
import 'package:enpal_tech_chall/ui/screens/main/main.screen.dart';
import 'package:enpal_tech_chall/ui/screens/main/solar/solar.screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

export 'package:enpal_tech_chall/core/enums/router.enum.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

// GoRouter configuration
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouterEnum.solar.navigation,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) => MainScreen(navigationShell: navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: RouterEnum.solar.navigation,
              builder: (_, GoRouterState state) => const SolarScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: RouterEnum.house.navigation,
              builder: (_, GoRouterState state) => const HouseScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: RouterEnum.battery.navigation,
              builder: (_, GoRouterState state) => const BatteryScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
