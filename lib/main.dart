import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:enpal_tech_chall/core/providers/initializer.dart';
import 'package:enpal_tech_chall/core/routing/app_router.dart';
import 'package:enpal_tech_chall/core/theming/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:get_it/get_it.dart';

void main() async {
  // Initialize widgets
  WidgetsFlutterBinding.ensureInitialized();

  final GetIt getIt = await initializeInjections();
  await getIt.allReady();
  // Initialize translations
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const <Locale>[Locale('en')],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = injector<AppTheme>();

    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        builder: (_, Widget? child) => child!,
        title: 'Enpal Tech Chall',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: appTheme.lightTheme,
        darkTheme: appTheme.darkTheme,
      ),
    );
  }
}
