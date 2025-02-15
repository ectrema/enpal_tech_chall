import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:enpal_tech_chall/ui/screens/main/house/house.view_model.dart';
import 'package:enpal_tech_chall/ui/screens/main/house/house.view_state.dart';
import 'package:enpal_tech_chall/ui/widget/custom_line_chart.dart';
import 'package:enpal_tech_chall/ui/widget/custom_text_button.dart';
import 'package:enpal_tech_chall/ui/widget/show_in_kilow_watt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HouseScreen extends ConsumerStatefulWidget {
  const HouseScreen({super.key});

  @override
  ConsumerState<HouseScreen> createState() => _HouseScreenState();
}

class _HouseScreenState extends ConsumerState<HouseScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      ref.read(houseViewModelProvider.notifier).setListener();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final HouseViewModel viewModel = ref.read(houseViewModelProvider.notifier);

    return Scaffold(
      key: viewModel.scaffoldKey,
      appBar: AppBar(
        title: Text(
          LocaleKeys.house_consumption.tr(),
          style: textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: ref.read(houseViewModelProvider.notifier).reloadData,
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
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime date = ref.watch(
      houseViewModelProvider.select((HouseState value) => value.date),
    );
    final HouseViewModel viewModel = ref.read(houseViewModelProvider.notifier);

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
      houseViewModelProvider.select(
        (HouseState value) => value.monitoring.hourlySum,
      ),
    );
    final bool showInKiloWatt = ref.watch(
      houseViewModelProvider.select((HouseState value) => value.showInKiloWatt),
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
      houseViewModelProvider.select((HouseState value) => value.showInKiloWatt),
    );
    final HouseViewModel viewModel = ref.read(houseViewModelProvider.notifier);

    return ShowInKiloWatt(
      showInKiloWatt: showInKiloWatt,
      onChanged: viewModel.setShowInKiloWatt,
    );
  }
}
