// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "solar": "Solar",
  "house": "House",
  "battery": "Battery",
  "watts": "{watts}W",
  "solar_generation": "Solar generation",
  "house_consumption": "House consumption",
  "battery_charge": "Battery consumption",
  "no_data": "No data for this date",
  "kilo_watt": "{kilo_watt}kWh",
  "show_in_kilo_watt": "Show in kWh"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en};
}
