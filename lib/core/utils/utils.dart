import 'dart:io';

import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatHour(DateTime date) {
    return DateFormat('h a').format(date);
  }

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

  static void showNoInternetSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(LocaleKeys.no_internet_connection.tr())),
    );
  }

  static void showGenericErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(LocaleKeys.generic_error.tr())));
  }
}
