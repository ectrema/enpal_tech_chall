import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:flutter/material.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({
    super.key,
    required this.title,
    required this.showInKiloWatt,
    required this.totalMonitoring,
    required this.averageMonitoring,
  });

  final String title;
  final bool showInKiloWatt;
  final int totalMonitoring;
  final double averageMonitoring;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: textTheme.headlineLarge),
            Text(
              showInKiloWatt
                  ? LocaleKeys.total_kilo_watt.tr(
                    namedArgs: <String, String>{
                      'kilo_watt': (totalMonitoring / 1000).toStringAsFixed(0),
                    },
                  )
                  : LocaleKeys.total.tr(
                    namedArgs: <String, String>{
                      'watts': totalMonitoring.toString(),
                    },
                  ),
              style: textTheme.headlineSmall,
            ),
            Text(
              showInKiloWatt
                  ? LocaleKeys.average_kilo_watt.tr(
                    namedArgs: <String, String>{
                      'average_kilo_watt': (averageMonitoring / 1000)
                          .toStringAsFixed(0),
                    },
                  )
                  : LocaleKeys.average.tr(
                    namedArgs: <String, String>{
                      'average': averageMonitoring.toStringAsFixed(0),
                    },
                  ),
              style: textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
