import 'dart:io';

import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Utility class providing helper methods for common functionality
class Utils {
  /// Formats a DateTime into a localized date string in dd/MM/yyyy format
  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  /// Formats a DateTime into a localized hour string in "h a" format (e.g. "3 PM")
  static String formatHour(DateTime date) {
    return DateFormat('h a').format(date);
  }

  /// Shows a platform-adaptive date picker dialog
  ///
  /// On Android, shows Material date picker
  /// On iOS, shows Cupertino date picker
  ///
  /// Parameters:
  /// - [context]: Build context for showing the dialog
  /// - [initialDate]: Initial date to show in the picker
  ///
  /// Returns selected DateTime or null if cancelled
  static Future<DateTime?> showNativeDatePicker({
    required BuildContext context,
    required DateTime initialDate,
  }) async {
    if (Platform.isAndroid) {
      return showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2020),
        lastDate: DateTime.now(),
      );
    }

    DateTime date = DateTime.now();

    await _showCupertinoDatePicker(
      context,
      CupertinoDatePicker(
        initialDateTime: initialDate,
        minimumDate: DateTime(2020),
        maximumDate: DateTime.now(),
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (DateTime value) {
          date = value;
        },
      ),
    );

    return date;
  }

  /// Helper method to show a Cupertino-style modal popup with a date picker
  ///
  /// Parameters:
  /// - [context]: Build context for showing the popup
  /// - [child]: Widget to show in the popup (typically a CupertinoDatePicker)
  static Future<DateTime?> _showCupertinoDatePicker(
    BuildContext context,
    Widget child,
  ) {
    return showCupertinoModalPopup(
      context: context,
      builder:
          (BuildContext context) => Container(
            height: 216,
            padding: const EdgeInsets.only(top: 6.0),
            // The Bottom margin is provided to align the popup above the system
            // navigation bar.
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // Provide a background color for the popup.
            color: CupertinoColors.systemBackground.resolveFrom(context),
            // Use a SafeArea widget to avoid system overlaps.
            child: SafeArea(top: false, child: child),
          ),
    );
  }

  /// Shows a snackbar indicating no internet connection
  ///
  /// Uses localized string from LocaleKeys
  static void showNoInternetSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(LocaleKeys.no_internet_connection.tr())),
    );
  }

  /// Shows a snackbar with a generic error message
  ///
  /// Uses localized string from LocaleKeys
  static void showGenericErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(LocaleKeys.generic_error.tr())));
  }
}
