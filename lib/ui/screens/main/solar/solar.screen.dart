import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:enpal_tech_chall/ui/screens/main/solar/solar.view_model.dart';
import 'package:enpal_tech_chall/ui/screens/main/solar/solar.view_state.dart';
import 'package:enpal_tech_chall/ui/widget/custom_line_chart.dart';
import 'package:enpal_tech_chall/ui/widget/custom_text_button.dart';
import 'package:enpal_tech_chall/ui/widget/no_internet_widget.dart';
import 'package:enpal_tech_chall/ui/widget/show_in_kilow_watt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SolarScreen extends ConsumerStatefulWidget {
  const SolarScreen({super.key});

  @override
  ConsumerState<SolarScreen> createState() => _SolarScreenState();
}

class _SolarScreenState extends ConsumerState<SolarScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      ref.read(solarViewModelProvider.notifier).setListener();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final SolarViewModel viewModel = ref.read(solarViewModelProvider.notifier);
    final bool showOfflineWidget = ref.watch(
      solarViewModelProvider.select(
        (SolarState value) => value.showOfflineWidget,
      ),
    );

    return Scaffold(
      key: viewModel.scaffoldKey,
      appBar: AppBar(
        title: Text(
          LocaleKeys.solar_generation.tr(),
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
      solarViewModelProvider.select((SolarState value) => value.date),
    );
    final SolarViewModel viewModel = ref.read(solarViewModelProvider.notifier);

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
      solarViewModelProvider.select(
        (SolarState value) => value.monitoring.hourlySum,
      ),
    );

    final bool showInKiloWatt = ref.watch(
      solarViewModelProvider.select((SolarState value) => value.showInKiloWatt),
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
      solarViewModelProvider.select((SolarState value) => value.showInKiloWatt),
    );
    final SolarViewModel viewModel = ref.read(solarViewModelProvider.notifier);

    return ShowInKiloWatt(
      showInKiloWatt: showInKiloWatt,
      onChanged: viewModel.setShowInKiloWatt,
    );
  }
}
