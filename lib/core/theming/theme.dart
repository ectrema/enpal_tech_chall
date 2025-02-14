import 'package:flutter/material.dart';

/// The [AppTheme] defines light and dark themes for the app.
final class AppTheme {
  /// Light [ColorScheme] made with FlexColorScheme v8.1.0.
  static ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF00687B),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFAFECFF),
    onPrimaryContainer: Color(0xFF001F27),
    primaryFixed: Color(0xFFAFECFF),
    primaryFixedDim: Color(0xFF85D2E8),
    onPrimaryFixed: Color(0xFF001F27),
    onPrimaryFixedVariant: Color(0xFF004E5D),
    secondary: Color(0xFF4B6269),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFCEE7EF),
    onSecondaryContainer: Color(0xFF061F25),
    secondaryFixed: Color(0xFFCEE7EF),
    secondaryFixedDim: Color(0xFFB2CBD3),
    onSecondaryFixed: Color(0xFF061F25),
    onSecondaryFixedVariant: Color(0xFF344A51),
    tertiary: Color(0xFF575C7E),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFDEE0FF),
    onTertiaryContainer: Color(0xFF141937),
    tertiaryFixed: Color(0xFFDEE0FF),
    tertiaryFixedDim: Color(0xFFC0C4EB),
    onTertiaryFixed: Color(0xFF141937),
    onTertiaryFixedVariant: Color(0xFF404565),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    surface: Color(0xFFF5FAFC),
    onSurface: Color(0xFF171C1E),
    surfaceDim: Color(0xFFD6DBDD),
    surfaceBright: Color(0xFFF5FAFC),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFEFF4F7),
    surfaceContainer: Color(0xFFE9EFF1),
    surfaceContainerHigh: Color(0xFFE4E9EB),
    surfaceContainerHighest: Color(0xFFDEE3E6),
    onSurfaceVariant: Color(0xFF40484B),
    outline: Color(0xFF70787C),
    outlineVariant: Color(0xFFBFC8CB),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF2C3133),
    onInverseSurface: Color(0xFFECF1F4),
    inversePrimary: Color(0xFF85D2E8),
    surfaceTint: Color(0xFF00687B),
  );

  /// Dark [ColorScheme] made with FlexColorScheme v8.1.0.
  static ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF85D2E8),
    onPrimary: Color(0xFF003641),
    primaryContainer: Color(0xFF004E5D),
    onPrimaryContainer: Color(0xFFAFECFF),
    primaryFixed: Color(0xFFAFECFF),
    primaryFixedDim: Color(0xFF85D2E8),
    onPrimaryFixed: Color(0xFF001F27),
    onPrimaryFixedVariant: Color(0xFF004E5D),
    secondary: Color(0xFFB2CBD3),
    onSecondary: Color(0xFF1D343A),
    secondaryContainer: Color(0xFF344A51),
    onSecondaryContainer: Color(0xFFCEE7EF),
    secondaryFixed: Color(0xFFCEE7EF),
    secondaryFixedDim: Color(0xFFB2CBD3),
    onSecondaryFixed: Color(0xFF061F25),
    onSecondaryFixedVariant: Color(0xFF344A51),
    tertiary: Color(0xFFC0C4EB),
    onTertiary: Color(0xFF292E4D),
    tertiaryContainer: Color(0xFF404565),
    onTertiaryContainer: Color(0xFFDEE0FF),
    tertiaryFixed: Color(0xFFDEE0FF),
    tertiaryFixedDim: Color(0xFFC0C4EB),
    onTertiaryFixed: Color(0xFF141937),
    onTertiaryFixedVariant: Color(0xFF404565),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: Color(0xFF0F1416),
    onSurface: Color(0xFFDEE3E6),
    surfaceDim: Color(0xFF0F1416),
    surfaceBright: Color(0xFF343A3C),
    surfaceContainerLowest: Color(0xFF090F11),
    surfaceContainerLow: Color(0xFF171C1E),
    surfaceContainer: Color(0xFF1B2022),
    surfaceContainerHigh: Color(0xFF252B2D),
    surfaceContainerHighest: Color(0xFF303638),
    onSurfaceVariant: Color(0xFFBFC8CB),
    outline: Color(0xFF899295),
    outlineVariant: Color(0xFF40484B),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFDEE3E6),
    onInverseSurface: Color(0xFF2C3133),
    inversePrimary: Color(0xFF00687B),
    surfaceTint: Color(0xFF85D2E8),
  );

  static TextTheme _createMaterial3TextTheme(
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return textTheme.copyWith(
      displayLarge: textTheme.displayLarge!.copyWith(
        color: colorScheme.onSurface,
        fontSize: 48,
        height: 1,
      ),
      displayMedium: textTheme.displayMedium!.copyWith(
        color: colorScheme.onSurface,
        fontSize: 40,
      ),
      displaySmall: textTheme.displaySmall!.copyWith(
        color: colorScheme.onSurface,
        fontSize: 34,
        height: 1,
      ),
      headlineLarge: textTheme.headlineLarge!.copyWith(
        color: colorScheme.onSurface,
        fontSize: 30,
      ),
      headlineMedium: textTheme.headlineMedium!.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        letterSpacing: 0.25,
        height: 34 / 24,
      ),
      headlineSmall: textTheme.headlineSmall!.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 18,
        height: 28 / 18,
        letterSpacing: 0.25,
      ),
      titleLarge: textTheme.titleLarge!.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 24 / 16,
        letterSpacing: 0.25,
      ),
      titleMedium: textTheme.titleMedium!.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        letterSpacing: 0.25,
        height: 20 / 14,
      ),
      titleSmall: textTheme.titleSmall!.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        letterSpacing: 0.25,
        height: 24 / 16,
      ),
      labelLarge: textTheme.labelLarge!.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: 0.25,
        height: 24 / 16,
      ),
      labelMedium: textTheme.labelMedium!.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        letterSpacing: 0.25,
      ),
      labelSmall: textTheme.labelSmall!.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        letterSpacing: 0.25,
        height: 20 / 16,
      ),
      bodyLarge: textTheme.bodyLarge!.copyWith(
        color: colorScheme.onSurface,
        fontSize: 16,

        height: 24 / 16,
        letterSpacing: 0.3,
      ),
      bodyMedium: textTheme.bodyMedium!.copyWith(
        color: colorScheme.onSurface,
        fontSize: 16,
      ),
      bodySmall: textTheme.bodySmall!.copyWith(
        color: colorScheme.onSurface,
        fontSize: 14,
        letterSpacing: 0.25,
        height: 16 / 12,
      ),
    );
  }

  ///
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: _createMaterial3TextTheme(
      Typography.blackMountainView,
      lightColorScheme,
    ),
  );

  ///
  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: _createMaterial3TextTheme(
      Typography.blackMountainView,
      darkColorScheme,
    ),
  );
}
