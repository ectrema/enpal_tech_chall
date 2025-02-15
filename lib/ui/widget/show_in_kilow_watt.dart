import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:flutter/material.dart';

class ShowInKiloWatt extends StatelessWidget {
  final bool showInKiloWatt;

  final Function(bool) onChanged;

  const ShowInKiloWatt({
    super.key,
    required this.showInKiloWatt,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(LocaleKeys.show_in_kilo_watt.tr()),
          Switch.adaptive(value: showInKiloWatt, onChanged: onChanged),
        ],
      ),
    );
  }
}
