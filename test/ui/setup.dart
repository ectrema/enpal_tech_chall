import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show Override, ProviderScope;
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

Future<Widget> pumpApp({
  required Widget home,
  required WidgetTester tester,
  List<Override> overrides = const <Override>[],
}) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues(<String, Object>{});

  final Widget app = EasyLocalization(
    supportedLocales: const <Locale>[Locale('en')],
    path: 'assets/translations',
    assetLoader: const CodegenLoader(),
    startLocale: const Locale('en'),
    child: ProviderScope(overrides: overrides, child: MaterialApp(home: home)),
  );

  await tester.pumpWidget(app);

  await tester.pumpAndSettle();

  return app;
}
