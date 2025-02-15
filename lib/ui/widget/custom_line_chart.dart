import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:enpal_tech_chall/core/utils/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({
    super.key,
    required this.data,
    required this.showInKiloWatt,
  });

  final Map<DateTime, double> data;

  final bool showInKiloWatt;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return LineChart(
      transformationConfig: FlTransformationConfig(
        scaleAxis: FlScaleAxis.horizontal,
        maxScale: 25.0,
      ),
      LineChartData(
        lineBarsData: <LineChartBarData>[
          LineChartBarData(
            spots:
                data.entries.map((MapEntry<DateTime, double> e) {
                  final DateTime index = e.key;
                  final double value =
                      showInKiloWatt ? e.value / 1000 : e.value;
                  return FlSpot(index.hour.toDouble(), value);
                }).toList(),
            dotData: const FlDotData(show: false),
            color: colorScheme.primary,
            barWidth: 1,
            shadow: Shadow(color: colorScheme.primary, blurRadius: 2),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: <Color>[
                  colorScheme.secondary.withAlpha(50),
                  colorScheme.secondary.withAlpha(0),
                ],
                stops: const <double>[0.5, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          touchSpotThreshold: 5,
          getTouchLineStart: (_, __) => -double.infinity,
          getTouchLineEnd: (_, __) => double.infinity,
          getTouchedSpotIndicator: (
            LineChartBarData barData,
            List<int> spotIndexes,
          ) {
            return spotIndexes.map((int spotIndex) {
              return TouchedSpotIndicatorData(
                FlLine(
                  color: colorScheme.primary,
                  strokeWidth: 1.5,
                  dashArray: const <int>[8, 2],
                ),
                FlDotData(
                  getDotPainter: (
                    FlSpot spot,
                    double percent,
                    LineChartBarData barData,
                    int index,
                  ) {
                    return FlDotCirclePainter(
                      radius: 6,
                      color: colorScheme.primary,
                      strokeColor: colorScheme.primary,
                    );
                  },
                ),
              );
            }).toList();
          },
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((LineBarSpot barSpot) {
                final double power = barSpot.y;
                final DateTime date =
                    data.entries
                        .firstWhere(
                          (MapEntry<DateTime, double> e) =>
                              e.key.hour == barSpot.x.toInt(),
                        )
                        .key;
                return LineTooltipItem(
                  '',
                  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: Utils.formatHour(date),
                      style: textTheme.labelMedium,
                    ),
                    TextSpan(
                      text:
                          showInKiloWatt
                              ? '\n${LocaleKeys.kilo_watt.tr(namedArgs: <String, String>{'kilo_watt': power.toStringAsFixed(2)})}'
                              : '\n${LocaleKeys.watts.tr(namedArgs: <String, String>{'watts': power.toInt().toString()})}',
                      style: textTheme.titleLarge,
                    ),
                  ],
                );
              }).toList();
            },
            getTooltipColor: (LineBarSpot barSpot) => colorScheme.surface,
          ),
        ),
        titlesData: FlTitlesData(
          rightTitles: const AxisTitles(),
          topTitles: const AxisTitles(),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 38,
              maxIncluded: false,
              minIncluded: false,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 38,
              maxIncluded: false,
              getTitlesWidget: (double value, TitleMeta meta) {
                final DateTime date =
                    data.entries
                        .firstWhere(
                          (MapEntry<DateTime, double> e) =>
                              e.key.hour == value.toInt(),
                        )
                        .key;
                return SideTitleWidget(
                  meta: meta,
                  child: Transform.rotate(
                    angle: -45 * 3.14 / 180,
                    child: Text(
                      Utils.formatHour(date),
                      style: textTheme.labelMedium,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      duration: const Duration(milliseconds: 200),
    );
  }
}
