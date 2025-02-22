import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:enpal_tech_chall/ui/screens/main/battery/battery.view_model.dart';
import 'package:enpal_tech_chall/ui/screens/main/battery/battery.view_state.dart';
import 'package:enpal_tech_chall/ui/widget/custom_line_chart.dart';
import 'package:enpal_tech_chall/ui/widget/custom_text_button.dart';
import 'package:enpal_tech_chall/ui/widget/information_widget.dart';
import 'package:enpal_tech_chall/ui/widget/no_internet_widget.dart';
import 'package:enpal_tech_chall/ui/widget/show_in_kilow_watt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BatteryScreen extends ConsumerStatefulWidget {
  const BatteryScreen({super.key});

  @override
  ConsumerState<BatteryScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends ConsumerState<BatteryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      ref.read(batteryViewModelProvider.notifier).setListener();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final BatteryViewModel viewModel = ref.read(
      batteryViewModelProvider.notifier,
    );
    final bool showOfflineWidget = ref.watch(
      batteryViewModelProvider.select(
        (BatteryState value) => value.showOfflineWidget,
      ),
    );

    return Scaffold(
      key: viewModel.scaffoldKey,
      appBar: AppBar(
        title: Text(
          LocaleKeys.battery_charge.tr(),
          style: textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: viewModel.reloadData,
          child: NoInternetWidget(
            showOfflineWidget: showOfflineWidget,
            onRefresh: viewModel.reloadData,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(const <Widget>[
                    _Header(),
                    _Graph(),
                    _Footer(),
                    _SolarInfo(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime date = ref.watch(
      batteryViewModelProvider.select((BatteryState value) => value.date),
    );
    final BatteryViewModel viewModel = ref.read(
      batteryViewModelProvider.notifier,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16),
        SelectDateButton(date: date, onPressed: viewModel.setDate),
      ],
    );
  }
}

class _Graph extends ConsumerWidget {
  const _Graph();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<DateTime, double> data = ref.watch(
      batteryViewModelProvider.select(
        (BatteryState value) => value.monitoring.hourlySum,
      ),
    );

    final bool showInKiloWatt = ref.watch(
      batteryViewModelProvider.select(
        (BatteryState value) => value.showInKiloWatt,
      ),
    );

    return AspectRatio(
      aspectRatio: 1.3,
      child: Padding(
        padding: const EdgeInsets.only(right: 18, top: 24),
        child: CustomLineChart(data: data, showInKiloWatt: showInKiloWatt),
      ),
    );
  }
}

class _Footer extends ConsumerWidget {
  const _Footer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool showInKiloWatt = ref.watch(
      batteryViewModelProvider.select(
        (BatteryState value) => value.showInKiloWatt,
      ),
    );
    final BatteryViewModel viewModel = ref.read(
      batteryViewModelProvider.notifier,
    );

    return ShowInKiloWatt(
      showInKiloWatt: showInKiloWatt,
      onChanged: viewModel.setShowInKiloWatt,
    );
  }
}

class _SolarInfo extends ConsumerWidget {
  const _SolarInfo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int totalMonitoring = ref.watch(
      batteryViewModelProvider.select(
        (BatteryState value) => value.totalMonitoring,
      ),
    );
    final bool showInKiloWatt = ref.watch(
      batteryViewModelProvider.select(
        (BatteryState value) => value.showInKiloWatt,
      ),
    );

    final double averageMonitoring = ref.watch(
      batteryViewModelProvider.select(
        (BatteryState value) => value.averageMonitoring,
      ),
    );
    final int highestMonitoring = ref.watch(
      batteryViewModelProvider.select(
        (BatteryState value) => value.highestMonitoring,
      ),
    );
    final int lowestMonitoring = ref.watch(
      batteryViewModelProvider.select(
        (BatteryState value) => value.lowestMonitoring,
      ),
    );
    return InformationWidget(
      title: LocaleKeys.battery_info.tr(),
      showInKiloWatt: showInKiloWatt,
      totalMonitoring: totalMonitoring,
      averageMonitoring: averageMonitoring,
      highestMonitoring: highestMonitoring,
      lowestMonitoring: lowestMonitoring,
    );
  }
}
